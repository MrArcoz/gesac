using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace GESAC
{
    public class ProyectosRepository : IProyectosRepository
    {
        readonly DBGESAC bd = new DBGESAC();
        readonly string cadena_cn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString();

        public IEnumerable<Proyectos> consulta()
        {
            DataTable dt = bd.executeReader(
                                            "uspProyectos"
                                            , new SqlParameter("@Opcion", 1)
                                            , new SqlParameter("@ID", "1")
                                            );
            List<Proyectos> proyectos = new List<Proyectos>();
            foreach (DataRow dr in dt.Rows)
            {
                Proyectos c = new Proyectos
                {
                    ID = Convert.ToInt16(dr["IdProyecto"].ToString()),
                    Proyecto = dr["Proyecto"].ToString(),
                    Descripcion = dr["Descripcion"].ToString(),
                    Avance  = dr["Avance"].ToString(),
                    Estatus = Convert.ToBoolean(dr["Estatus"].ToString())
                };
                proyectos.Add(c);
            }

            return proyectos;
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
                    bd.executeNonQuery("uspProyectos", new SqlParameter("@Opcion", 2), new SqlParameter("@ID", id));
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