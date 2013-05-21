using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GESAC
{
    public interface IUsuariosRepository
    {
        IEnumerable<Usuarios> consulta();
        bool estatus(String id);
    }
}
