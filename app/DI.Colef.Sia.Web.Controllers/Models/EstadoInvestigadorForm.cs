using System;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class EstadoInvestigadorForm
    {
        public int Id { get; set; }
        public string FechaInicial { get; set; }
        public string FechaFinal { get; set; }
        public string EstadoNombre { get; set; }
        public int Estado { get; set; }

        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        public string ComprobanteNombre { get; set; }

        public int ComprobanteId { get; set; }
    }
}