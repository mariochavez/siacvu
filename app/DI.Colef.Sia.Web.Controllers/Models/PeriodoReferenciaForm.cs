using System;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class PeriodoReferenciaForm
    {		
		public int Id { get; set; }
		public string Periodo { get; set; }
		public int Orden { get; set; }
		public DateTime FechaInicial { get; set; }
		public DateTime FechaFinal { get; set; }
		public bool Activo { get; set; }
		public string Modificacion { get; set; }
    }
}
