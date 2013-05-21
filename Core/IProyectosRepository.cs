using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GESAC
{
    public interface IProyectosRepository
    {
        IEnumerable<Proyectos> consulta();
        bool estatus(int id);
    }
}
