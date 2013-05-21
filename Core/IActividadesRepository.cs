using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace GESAC
{
    public interface IActividadesRepository
    {
        DataTable consulta(string usuario, string estatus, DateTime inicio, DateTime fin);
        void noNotificacion(int expediente, string usuario);
        IEnumerable<Participantes> participantes(int actividad);
    }
}
