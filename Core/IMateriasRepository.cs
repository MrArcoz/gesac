using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GESAC
{
    public interface IMateriasRepository
    {
        IEnumerable<Materias> consulta();
        bool estatus(int id);
    }
}
