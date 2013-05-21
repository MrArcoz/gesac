using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GESAC
{
    public interface IClientesRepository
    {
        //Create
        //bool alta(String nombre, String appat, String apmat, int tipo, String usuario, String contraseña);

        //Read
        IEnumerable<Clientes> consulta();
        
        //Update
        //bool modificar(int id, String nombre, String appat, String apmat, int tipo, String usuario, String contraseña);

        //Delete
        bool estatus(int id);
    }
}
