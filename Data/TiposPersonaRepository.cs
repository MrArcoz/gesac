﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace GESAC
{
    public class TiposPersonaRepository : ITiposPersonaRepository
    {
        readonly DBGESAC bd = new DBGESAC();
        readonly string cadena_cn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString();

        public IEnumerable<TiposPersona> consulta()
        {
            DataTable dt = bd.executeReader(
                                            "uspTiposPersona"
                                            , new SqlParameter("@Opcion", 1)
                                            , new SqlParameter("@ID", "1")
                                            );
            List<TiposPersona> tipos = new List<TiposPersona>();
            foreach (DataRow dr in dt.Rows)
            {
                TiposPersona c = new TiposPersona
                {
                    Id = Convert.ToInt16(dr["IdTipoPersona"].ToString()),
                    TipoPersona = dr["TipoPersona"].ToString(),
                    Estatus = Convert.ToBoolean(dr["Estatus"].ToString())
                };
                tipos.Add(c);
            }

            return tipos;
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
                    bd.executeNonQuery("uspTiposPersona", new SqlParameter("@Opcion", 2), new SqlParameter("@ID", id));
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