using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace GESAC
{
    public class MateriasRepository : IMateriasRepository
    {
        readonly DBGESAC bd = new DBGESAC();
        readonly string cadena_cn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString();

        public IEnumerable<Materias> consulta()
        {
            DataTable dt = bd.executeReader(
                                            "uspMaterias"
                                            , new SqlParameter("@Opcion", 1)
                                            , new SqlParameter("@ID", "1")
                                            );
            List<Materias> materias = new List<Materias>();
            foreach (DataRow dr in dt.Rows)
            {
                Materias c = new Materias
                {
                    ID = Convert.ToInt16(dr["IdMateria"].ToString()),
                    Materia = dr["Materia"].ToString(),
                    Estatus = Convert.ToBoolean(dr["Estatus"].ToString())
                };
                materias.Add(c);
            }

            return materias;
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
                    bd.executeNonQuery("uspMaterias", new SqlParameter("@Opcion", 2), new SqlParameter("@ID", id));
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