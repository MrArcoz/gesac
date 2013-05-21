using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace GESAC
{
    public class UsuariosRepository : IUsuariosRepository
    {
        readonly DBGESAC bd = new DBGESAC();
        readonly string cadena_cn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString();

        public IEnumerable<Usuarios> consulta()
        {
            DataTable dt = bd.executeReader(
                                            "uspUsuarios"
                                            , new SqlParameter("@Opcion", 1)
                                            , new SqlParameter("@ID", "1")
                                            );
            List<Usuarios> usuarios = new List<Usuarios>();
            foreach (DataRow dr in dt.Rows)
            {
                Usuarios c = new Usuarios
                {
                    Usuario = dr["IdUser"].ToString(),
                    Nombre = dr["Nombre"].ToString(),
                    Tipo = dr["TipoPersona"].ToString(),
                    Estatus = Convert.ToBoolean(dr["Status"].ToString())
                };
                usuarios.Add(c);
            }

            return usuarios;
        }

        public bool estatus(String id)
        {
            bool operacion_exitosa = true;

            using (IDatabaseFactory factory = new DatabaseFactory(cadena_cn))
            {
                IUnitOfWork unitofwork = new UnitOfWork(factory);
                unitofwork.Open();
                unitofwork.BeginTransaction();
                SqlCommand cmd = factory.Get().CreateCommand();
                factory.GetTransaction();
                try
                {
                    bd.executeNonQuery("uspUsuarios", new SqlParameter("@Opcion", 2), new SqlParameter("@ID", id));
                }
                catch (Exception ex)
                {
                    unitofwork.Rollback();
                    operacion_exitosa = false;
                }
                if (operacion_exitosa)
                    unitofwork.Commit();
                unitofwork.Close();
            }

            return operacion_exitosa;
        }
    }
}