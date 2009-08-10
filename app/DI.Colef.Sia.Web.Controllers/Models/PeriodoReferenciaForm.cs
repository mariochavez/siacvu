namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class PeriodoReferenciaForm
    {		
		public int Id { get; set; }
		public string Periodo { get; set; }
		public int Orden { get; set; }
        public string FechaInicial { get; set; }
        public string FechaFinal { get; set; }
		public bool Activo { get; set; }
		public string Modificacion { get; set; }
    }
}
