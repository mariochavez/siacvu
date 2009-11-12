namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class OrganoInternoForm
    {
		public int Id { get; set; }
		public string Nombre { get; set; }
		public string FechaInicial { get; set; }
		public string FechaFinal { get; set; }
		public int Periodo { get; set; }
		public bool Activo { get; set; }
		public string Modificacion { get; set; }
        public string DepartamentoNombre { get; set; }
        public string SedeNombre { get; set; }

        public int ConsejoComision { get; set; }
        public int ConsejoComisionId { get; set; }
        public string ConsejoComisionNombre { get; set; }
		
		/* Catalogos */
		public ConsejoComisionForm[] ConsejosComisiones { get; set; }
        public CustomSelectForm[] Periodos { get; set; }
    }
}