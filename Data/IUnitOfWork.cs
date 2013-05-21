using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GESAC
{
    public interface IUnitOfWork
    {
        void Open();
        void Close();
        void BeginTransaction();
        void Commit();
        void Rollback();
    }
}