using System;

namespace DecisionesInteligentes.Colef.Sia.Core.DataInterfaces
{
    public class CurriculumDTO : ProductoDTO
    {
        public DateTime FechaPublicacion { get; set; }
        public string Volumen{ get; set;}
        public string Numero { get; set; }
        public int PaginaInicial{ get; set;}
        public int PaginaFinal { get; set; }

        public string[] AutoresNombre { get; set;}
    }
}
