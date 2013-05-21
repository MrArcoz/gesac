using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GESAC
{
    public class PermisosUsuario
    {
        public int IdPermiso { get; set; }
        public String IdUsuario { get; set; }
        public int Valor { get; set; }
        public bool Visible { get; set; }
    }
}