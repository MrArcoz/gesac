using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GESAC
{
    public interface IEstatusRepository
    {
        IEnumerable<Estatus> consulta();
        bool estatus(String id);
    }
}
