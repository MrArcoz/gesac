using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace GESAC
{
    public class ConfiguracionRepository : IConfiguracionRepository
    {
        readonly DBGESAC bd = new DBGESAC();
        readonly string cadena_cn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString();

        public IEnumerable<Configuracion> consulta()
        {
            DataTable dt = bd.executeReader(
                                            "uspConfiguracion"
                                            , new SqlParameter("@Opcion", 1)
                                            , new SqlParameter("@ID", 1)
                                            );
            List<Configuracion> config = new List<Configuracion>();
            foreach (DataRow dr in dt.Rows)
            {
                Configuracion c = new Configuracion
                {
                   ID = Convert.ToInt16(dr["ID"].ToString()),
                   Descripcion = dr["Descripcion"].ToString(),
                   Valor = Convert.ToBoolean(dr["Valor"].ToString())
                };
                config.Add(c);
            }

            return config;
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
                    bd.executeNonQuery("uspConfiguracion", new SqlParameter("@Opcion", 2), new SqlParameter("@ID", id));
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