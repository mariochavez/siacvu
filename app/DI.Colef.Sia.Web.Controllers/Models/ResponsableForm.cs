namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ResponsableForm
    {
        public int Id { get; set; }
        public string Controller { get; set; }
        public string IdName { get; set; }

        public ResponsableInternoProductoForm[] ResponsablesInternos { get; set; }
        public ResponsableExternoProductoForm[] ResponsablesExternos { get; set; }
        public int ModelId { get; set; }
        public int InvestigadorExternoId { get; set; }
        public int InvestigadorId { get; set; }
    }
}