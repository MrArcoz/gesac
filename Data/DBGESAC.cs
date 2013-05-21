using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace GESAC
{
    public class DBGESAC
    {
        public void executeNonQuery(string spname, params SqlParameter[] args)
        {
            SqlConnection cn = new SqlConnection(this.cadenaConexion);
            cn.Open();

            SqlCommand cmd = new SqlCommand() { Connection = cn, CommandType = CommandType.StoredProcedure, CommandTimeout = 100, CommandText = spname };

            if (args != null)
            {
                foreach (SqlParameter param in args)
                {
                    cmd.Parameters.Add(param);
                }
            }

            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }

            cn.Close();
            cn.Dispose();
            cmd.Dispose();
        }

        public object executeScalar(string spname, params SqlParameter[] args)
        {
            object res;
            SqlConnection cn = new SqlConnection(this.cadenaConexion);
            cn.Open();

            SqlCommand cmd = new SqlCommand() { Connection = cn, CommandType = CommandType.StoredProcedure, CommandTimeout = 100, CommandText = spname };

            if (args != null)
            {
                foreach (SqlParameter param in args)
                {
                    cmd.Parameters.Add(param);
                }
            }

            try
            {
                res = cmd.ExecuteScalar();
            }
            catch (Exception ex)
            {
                throw ex;
            }

            cn.Close();
            cn.Dispose();
            cmd.Dispose();

            return res;
        }

        public DataTable executeReader(string spname, params SqlParameter[] args)
        {
            DataTable dt = new DataTable();
            SqlConnection cn = new SqlConnection(this.cadenaConexion);
            cn.Open();

            SqlCommand cmd = new SqlCommand() { Connection = cn, CommandType = CommandType.StoredProcedure, CommandTimeout = 100, CommandText = spname };

            if (args != null)
            {
                foreach (SqlParameter param in args)
                {
                    cmd.Parameters.Add(param);
                }
            }

            try
            {
                dt.Load(cmd.ExecuteReader());
            }
            catch (Exception ex)
            {
                throw ex;
            }

            cn.Close();
            cn.Dispose();
            cmd.Dispose();

            return dt;
        }

        public bool validarCadena()
        {
            bool estatus;
            SqlConnection cnn = new SqlConnection(this.cadenaConexion);
            try
            {
                cnn.Open();
                estatus = true;
            }
            catch (Exception ex)
            {
                estatus = false;
            }
            finally
            {
                cnn.Close();
                cnn.Dispose();
            }

            return estatus;
        }

        public string cadenaConexion
        {
            get
            {
                string cn;
                //Configuration config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
                //ConfigurationSection section = config.GetSection("connectionStrings") as ConfigurationSection;

                //section.SectionInformation.UnprotectSection();
                cn = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
                //section.SectionInformation.ProtectSection("DataProtectionConfigurationProvider");

                return cn;
            }
            set
            {
                Configuration config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
                ConnectionStringsSection css = config.ConnectionStrings;
                ConfigurationSection section = config.GetSection("connectionStrings") as ConfigurationSection;

                section.SectionInformation.UnprotectSection();
                css.ConnectionStrings["ApplicationServices"].ConnectionString = value;
                section.SectionInformation.ProtectSection("DataProtectionConfigurationProvider");

                config.Save(ConfigurationSaveMode.Modified, true);
            }
        }
    }
}