using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GESAC
{
    public class Expedientes
    {
        public int ID { get; set; }
        public String Expediente { get; set; }
        public String Juzgado { get; set; }
        //public DateTime Año { get; set; }
        //public DateTime FechaCaptura { get; set; }
        //public int Tipo { get; set; }
        
        //public String Autorizados { get; set; }
        //public String Actores { get; set; }
        //public String Demandados { get; set; }
        public String Materia { get; set; }
        public String Estado { get; set; }
        public String Asunto { get; set; }
        public String Estatus { get; set; }

        //public String Domicilio { get; set; }
        //public String Titular { get; set; }
        //public int TipoRevision { get; set; }
        //public DateTime UltimaRevision { get; set; }
    }
}