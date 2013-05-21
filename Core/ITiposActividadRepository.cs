using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GESAC
{
    public interface ITiposActividadRepository
    {
        IEnumerable<TiposActividad> consulta();
        bool estatus(String id);
    }
}
