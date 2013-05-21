using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GESAC
{
    public interface IConfiguracionRepository
    {
        IEnumerable<Configuracion> consulta();
        bool estatus(int id);
    }
}
