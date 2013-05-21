using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GESAC
{
    public class PermisosCatalogo
    {
        public int IdUsuario { get; set; }
        public int IdCatalogo { get; set; }
        public bool Read { get; set; }
        public bool Write { get; set; }
    }
}