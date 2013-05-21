using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace GESAC
{
    public interface IExpedientesRepository
    {
        DataTable consulta(String expediente, String cliente);
        //bool estatus(String id);
    }
}
