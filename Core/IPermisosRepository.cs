using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GESAC
{
    public interface IPermisosRepository
    {
        IEnumerable<Permisos> consulta();
        bool estatus(int id);
    }
}
