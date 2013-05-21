using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GESAC
{
    public interface ITiposPersonaRepository
    {
        IEnumerable<TiposPersona> consulta();
        bool estatus(int id);
    }
}
