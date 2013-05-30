using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace GESAC
{
    public class ActividadesRepository : IActividadesRepository
    {
        readonly DBGESAC bd = new DBGESAC();
        readonly string cadena_cn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString();

        public DataTable consulta(string usuario, string estatus, DateTime inicio, DateTime fin)
        {
            return bd.executeReader(
                                    "uspActividades"
                                    , new SqlParameter("@Opcion", 1)
                                    , new SqlParameter("@ID", "1")
                                    , new SqlParameter("@Usuario", usuario)
                                    , new SqlParameter("@Estatus", estatus)
                                    , new SqlParameter("@FechaIni", inicio)
                                    , new SqlParameter("@FechaFin", fin)
                                    );
        }

        public DataTable consulta(int expediente)
        {
            return bd.executeReader(
                                    "uspActividades"
                                    , new SqlParameter("@Opcion", 4)
                                    , new SqlParameter("@ID", expediente)
                                    , new SqlParameter("@Usuario", String.Empty)
                                    , new SqlParameter("@Estatus", String.Empty)
                                    , new SqlParameter("@FechaIni", String.Empty)
                                    , new SqlParameter("@FechaFin", String.Empty)
                                    );
        }

        public void noNotificacion(int expediente, string usuario)
        {
            bd.executeNonQuery(
                "uspActividades"
                , new SqlParameter("@Opcion", 2)
                , new SqlParameter("@ID", expediente)
                , new SqlParameter("@Usuario", usuario)
                , new SqlParameter("@Estatus", String.Empty)
                , new SqlParameter("@FechaIni", DateTime.Today)
                , new SqlParameter("@FechaFin", DateTime.Today)
                );
        }

        public IEnumerable<Participantes> participantes(int actividad)
        {
            List<Participantes> persona = new List<Participantes>();

            DataTable personas = new DataTable();

            personas = bd.executeReader(
                "uspActividades"
                , new SqlParameter("@Opcion", 3)
                , new SqlParameter("@ID", actividad)
                , new SqlParameter("@Usuario", String.Empty)
                , new SqlParameter("@Estatus", String.Empty)
                , new SqlParameter("@FechaIni", DateTime.Today)
                , new SqlParameter("@FechaFin", DateTime.Today)
                );

            foreach (DataRow r in personas.Rows)
            {
                Participantes p = new Participantes
                {
                    Nombre = r["Nombre"].ToString(),
                    Correo = r["Correo"].ToString()
                };
                persona.Add(p);
            }

            return persona;
        }
    }
}
