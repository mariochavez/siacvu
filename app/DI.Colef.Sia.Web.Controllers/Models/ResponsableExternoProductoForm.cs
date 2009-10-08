namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ResponsableExternoProductoForm
    {
        public int Id { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        public int InvestigadorExternoId { get; set; }
        public string InvestigadorExternoNombre { get; set; }

        public int FormaParticipacionId { get; set; }
        public string FormaParticipacionNombre { get; set; }

        public int ParentId { get; set; }
    }
}