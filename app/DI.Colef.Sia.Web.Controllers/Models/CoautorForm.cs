using System;

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
        public int InvestigadorExternoId { get; set; }
        public int InvestigadorId { get; set; }

        public InvestigadorExternoForm InvestigadorExterno { get; set; }

        public int CreadoPorId { get; set; }
        public bool EsAlfabeticamente { get; set; }

        //public string UrlAction { get; set; }
    }
}
