using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace GESAC
{
    public class DatabaseFactory : Disposable, IDatabaseFactory
    {
        private SqlConnection _conection;
        private String _cadenaConexion;
        private SqlTransaction _transaction;


        public DatabaseFactory(string cadenaConexion)
        {
            _cadenaConexion = cadenaConexion;
        }
        public SqlConnection Get()
        {
            return _conection ?? (_conection = new SqlConnection(_cadenaConexion));

        }
        protected override void DisposeCore()
        {
            if (_conection != null)
                _conection.Dispose();
        }


        public SqlTransaction GetTransaction()
        {
            return _transaction ?? (_transaction = Get().BeginTransaction());
        }
    }
}