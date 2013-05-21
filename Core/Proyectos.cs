using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GESAC
{
    public class Proyectos
    {
        public int ID { get; set; }
        public String Proyecto { get; set; }
        public String Descripcion { get; set; }
        public String Avance { get; set; }
        public bool Estatus { get; set; }
    }
}