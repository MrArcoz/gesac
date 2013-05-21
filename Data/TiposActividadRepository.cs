using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace GESAC
{
    public class TiposActividadRepository : ITiposActividadRepository
    {
        readonly DBGESAC bd = new DBGESAC();
        readonly string cadena_cn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString();

        public IEnumerable<TiposActividad> consulta()
        {
            DataTable dt = bd.executeReader(
                                            "uspTiposActividad"
                                            , new SqlParameter("@Opcion", 1)
                                            , new SqlParameter("@ID", "1")
                                            );
            List<TiposActividad> tipos = new List<TiposActividad>();
            foreach (DataRow dr in dt.Rows)
            {
                TiposActividad c = new TiposActividad
                {
                    Id = dr["IdTipoActividad"].ToString(),
                    TipoActividad = dr["TipoActividad"].ToString(),
                    Estatus = Convert.ToBoolean(dr["Estatus"].ToString())
                };
                tipos.Add(c);
            }

            return tipos;
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
                    bd.executeNonQuery("uspTiposActividad", new SqlParameter("@Opcion", 2), new SqlParameter("@ID", id));
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