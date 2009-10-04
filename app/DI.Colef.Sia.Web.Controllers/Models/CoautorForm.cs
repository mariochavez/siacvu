namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class CoautorForm
    {
        public int Id { get; set; }
        public string Controller { get; set; }
        public string IdName { get; set; }

        public CoautorInternoProductoForm[] CoautoresInternos { get; set; }
        public CoautorExternoProductoForm[] CoautoresExternos { get; set; }
        public int ModelId { get; set; }
    }
}
