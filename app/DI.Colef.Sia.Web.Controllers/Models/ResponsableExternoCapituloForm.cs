namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ResponsableExternoCapituloForm
    {
        public int Id { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        public int InvestigadorExternoId { get; set; }
        public string InvestigadorExternoNombre { get; set; }
        public int TotalEditores { get; set; }
	}
}
