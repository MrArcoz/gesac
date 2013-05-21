using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GESAC
{
    public interface IEstadosRepository
    {
        IEnumerable<Estados> consulta();
        bool estatus(int id);
    }
}
