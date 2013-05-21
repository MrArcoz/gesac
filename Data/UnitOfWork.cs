using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;

namespace GESAC
{
    public class UnitOfWork : IUnitOfWork
    {
        private SqlConnection _conection;
        private readonly IDatabaseFactory databaseFactory;
        private SqlTransaction _transaccion;

        public UnitOfWork(IDatabaseFactory databaseFactory)
        {
            this.databaseFactory = databaseFactory;
        }

        public SqlConnection Conection { get { return _conection ?? (_conection = databaseFactory.Get()); } }

        public void Open()
        {
            Conection.Open();
        }

        public void Close()
        {
            Conection.Close();
        }


        public void BeginTransaction()
        {
            _transaccion = databaseFactory.GetTransaction();
        }

        public void Commit()
        {
            if (_transaccion != null)
                _transaccion.Commit();
        }


        public void Rollback()
        {
            if (_transaccion != null)
            {
                _transaccion.Rollback();
            }


        }
    }
}