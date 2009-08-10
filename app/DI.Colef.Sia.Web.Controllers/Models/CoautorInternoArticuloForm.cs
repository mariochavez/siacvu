using System;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class CoautorInternoArticuloForm
    {
        public int Id { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        public int InvestigadorId { get; set; }
        public string InvestigadorUsuarioPersonaNombre { get; set; }
    }
}
