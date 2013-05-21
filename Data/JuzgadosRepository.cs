using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace GESAC
{
    public class JuzgadosRepository : IJuzgadosRepository
    {
        readonly DBGESAC bd = new DBGESAC();
        readonly string cadena_cn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString();

        public IEnumerable<Juzgados> consulta()
        {
            DataTable dt = bd.executeReader(
                                            "uspJuzgados"
                                            , new SqlParameter("@Opcion", 1)
                                            , new SqlParameter("@ID", "1")
                                            );
            List<Juzgados> juzgados = new List<Juzgados>();
            foreach (DataRow dr in dt.Rows)
            {
                Juzgados c = new Juzgados
                {
                    NoJuzgado = Convert.ToInt16(dr["NoJuzgado"].ToString()),
                    Juzgado = dr["Juzgado"].ToString(),
                    Materia = dr["Materia"].ToString(),
                    Estado = dr["Estado"].ToString(),
                    Estatus = Convert.ToBoolean(dr["Estatus"].ToString())
                };
                juzgados.Add(c);
            }

            return juzgados;
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
                    bd.executeNonQuery("uspJuzgados", new SqlParameter("@Opcion", 2), new SqlParameter("@ID", id));
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