using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GESAC
{
    public interface ITiposRepository
    {
        IEnumerable<Tipos> consulta();
        bool estatus(int id);
    }
}
