using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GESAC
{
    public interface IJuzgadosRepository
    {
        IEnumerable<Juzgados> consulta();
        bool estatus(int id);
    }
}
