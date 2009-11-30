using System;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class InvestigadorExternoForm
    {		
		public int Id { get; set; }
		public string Nombre { get; set; }
        public string ApellidoPaterno { get; set; }
        public string ApellidoMaterno { get; set; }
		public bool Activo { get; set; }
		public string Modificacion { get; set; }
    }
}
