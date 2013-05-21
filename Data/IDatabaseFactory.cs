using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace GESAC
{
    public interface IDatabaseFactory : IDisposable
    {
        SqlConnection Get();
        SqlTransaction GetTransaction();
    }
}