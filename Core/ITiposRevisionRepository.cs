using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GESAC
{
    public interface ITiposRevisionRepository
    {
        IEnumerable<TiposRevision> consulta();
        bool estatus(int id);
    }
}
