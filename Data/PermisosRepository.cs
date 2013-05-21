using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace GESAC
{
    public class PermisosRepository : IPermisosRepository
    {
        readonly DBGESAC bd = new DBGESAC();
        readonly string cadena_cn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString();

        public IEnumerable<Permisos> consulta()
        {
            DataTable dt = bd.executeReader(
                                            "uspPermisos"
                                            , new SqlParameter("@Opcion", 1)
                                            , new SqlParameter("@ID", "1")
                                            );
            List<Permisos> permisos = new List<Permisos>();
            foreach (DataRow dr in dt.Rows)
            {
                Permisos c = new Permisos
                {
                    ID = Convert.ToInt16(dr["IdPermiso"].ToString()),
                    Permiso = dr["Permiso"].ToString(),
                    Estatus = Convert.ToBoolean(dr["Estatus"].ToString())
                };
                permisos.Add(c);
            }

            return permisos;
        }

        public bool estatus(int id)
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
                    bd.executeNonQuery("uspPermisos", new SqlParameter("@Opcion", 2), new SqlParameter("@ID", id));
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