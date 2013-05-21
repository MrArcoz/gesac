using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace GESAC
{
    public class ClientesRepository : IClientesRepository
    {
        readonly DBGESAC bd = new DBGESAC();
        readonly string cadena_cn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString();

        //public bool alta(String nombre, String appat, String apmat, int tipo, String usuario, String contraseña)
        //{
        //    bool operacion_exitosa = true;

        //    using (IDatabaseFactory factory = new DatabaseFactory(cadena_cn))
        //    {
        //        IUnitOfWork unitofwork = new UnitOfWork(factory);
        //        unitofwork.Open();
        //        unitofwork.BeginTransaction();
        //        SqlCommand cmd = factory.Get().CreateCommand();
        //        factory.GetTransaction();
        //        try
        //        {
        //            bd.executeNonQuery("uspClientes", new SqlParameter("@Opcion", 1), new SqlParameter("@ID", 1), new SqlParameter("@Nombre", nombre), new SqlParameter("@APaterno", appat), new SqlParameter("@AMaterno", apmat), new SqlParameter("@IdTipo", tipo), new SqlParameter("@Usuario", usuario), new SqlParameter("@Password", contraseña));
        //        }
        //        catch (Exception ex)
        //        {
        //            unitofwork.Rollback();
        //            operacion_exitosa = false;
        //        }
        //        if (operacion_exitosa)
        //            unitofwork.Commit();
        //        unitofwork.Close();
        //    }

        //    return operacion_exitosa;
        //}

        public IEnumerable<Clientes> consulta()
        {
            DataTable dt = bd.executeReader(
                                            "uspClientes"
                                            , new SqlParameter("@Opcion", 2)
                                            , new SqlParameter("@ID", 1)
                                            , new SqlParameter("@Nombre", "")
                                            , new SqlParameter("@APaterno", "")
                                            , new SqlParameter("@AMaterno", "")
                                            , new SqlParameter("@IdTipo", 1)
                                            , new SqlParameter("@Usuario", "")
                                            , new SqlParameter("@Password", "")
                                            );
            List<Clientes> clientes = new List<Clientes>();
            foreach (DataRow dr in dt.Rows)
            {
                Clientes c = new Clientes
                {
                   ID = Convert.ToInt16(dr["ID"].ToString()),
                   Nombre = dr["Nombre"].ToString(),
                   Tipo = dr["TipoPersona"].ToString(),
                   Usuario = dr["Usuario"].ToString(),
                   Estatus = Convert.ToBoolean(dr["Estatus"].ToString())
                };
                clientes.Add(c);
            }

            return clientes;
        }

        //public bool modificar(int id, String nombre, String appat, String apmat, int tipo, String usuario, String contraseña)
        //{
        //    bool operacion_exitosa = true;

        //    using (IDatabaseFactory factory = new DatabaseFactory(cadena_cn))
        //    {
        //        IUnitOfWork unitofwork = new UnitOfWork(factory);
        //        unitofwork.Open();
        //        unitofwork.BeginTransaction();
        //        SqlCommand cmd = factory.Get().CreateCommand();
        //        factory.GetTransaction();
        //        try
        //        {
        //            bd.executeNonQuery("uspClientes", new SqlParameter("@Opcion", 3), new SqlParameter("@ID", id), new SqlParameter("@Nombre", nombre), new SqlParameter("@APaterno", appat), new SqlParameter("@AMaterno", apmat), new SqlParameter("@IdTipo", tipo), new SqlParameter("@Usuario", usuario), new SqlParameter("@Password", contraseña));
        //        }
        //        catch (Exception ex)
        //        {
        //            unitofwork.Rollback();
        //            operacion_exitosa = false;
        //        }
        //        if (operacion_exitosa)
        //            unitofwork.Commit();
        //        unitofwork.Close();
        //    }

        //    return operacion_exitosa;
        //}

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
                    bd.executeNonQuery("uspClientes", new SqlParameter("@Opcion", 4), new SqlParameter("@ID", id), new SqlParameter("@Nombre", String.Empty), new SqlParameter("@APaterno", String.Empty), new SqlParameter("@AMaterno", String.Empty), new SqlParameter("@IdTipo", String.Empty), new SqlParameter("@Usuario", String.Empty), new SqlParameter("@Password", String.Empty));
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