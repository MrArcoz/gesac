using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace GESAC
{
    public class EstatusRepository : IEstatusRepository
    {
        readonly DBGESAC bd = new DBGESAC();
        readonly string cadena_cn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString();

        public IEnumerable<Estatus> consulta()
        {
            DataTable dt = bd.executeReader(
                                            "uspEstatus"
                                            , new SqlParameter("@Opcion", 1)
                                            , new SqlParameter("@ID", "1")
                                            );
            List<Estatus> estatus = new List<Estatus>();
            foreach (DataRow dr in dt.Rows)
            {
                Estatus c = new Estatus
                {
                    IdStatus = dr["IdStatus"].ToString(),
                    Status = dr["Status"].ToString(),
                    bEstatus = Convert.ToBoolean(dr["Estatus"].ToString())
                };
                estatus.Add(c);
            }

            return estatus;
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
                    bd.executeNonQuery("uspEstatus", new SqlParameter("@Opcion", 2), new SqlParameter("@ID", id));
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