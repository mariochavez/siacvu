namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class AutorForm
    {
        public int Id { get; set; }
        public string Controller { get; set; }
        public string IdName { get; set; }

        public AutorInternoProductoForm[] AutoresInternos { get; set; }
        public AutorExternoProductoForm[] AutoresExternos { get; set; }
        public int ModelId { get; set; }
        public int InvestigadorExternoId { get; set; }
        public int InvestigadorId { get; set; }

        public InvestigadorExternoForm InvestigadorExterno { get; set; }
    }
}