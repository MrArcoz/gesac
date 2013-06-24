using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace GESAC
{
    public class ExpedientesRepository : IExpedientesRepository
    {
        readonly DBGESAC bd = new DBGESAC();
        readonly string cadena_cn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString();

        public DataTable consulta(String expediente, String cliente)
        {
            return bd.executeReader(
                                    "uspExpedientes"
                                    , new SqlParameter("@Opcion", 1)
                                    , new SqlParameter("@NoExpediente", expediente.Trim())
                                    , new SqlParameter("@Cliente", cliente.Trim())
                                    );
        }

        public DataTable consulta(String cliente)
        {
            return bd.executeReader(
                                    "uspExpedientes"
                                    , new SqlParameter("@Opcion", 2)
                                    , new SqlParameter("@NoExpediente", String.Empty)
                                    , new SqlParameter("@Cliente", cliente.Trim())
                                    );
        }

        public DataTable get(string expediente)
        {
            return bd.executeReader(
                                   "uspExpedientes"
                                   , new SqlParameter("@Opcion", 3)
                                   , new SqlParameter("@NoExpediente", expediente)
                                   , new SqlParameter("@Cliente", String.Empty)
                                   );
        }
    }
}