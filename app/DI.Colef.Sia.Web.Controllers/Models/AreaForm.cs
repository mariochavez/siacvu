using System;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class AreaForm
    {		
		public int Id { get; set; }
		public string Nombre { get; set; }
		public bool Activo { get; set; }
		public string Modificacion { get; set; }

        public int AreaTematica { get; set; }
        public int AreaTematicaId { get; set; }

        public AreaTematicaForm[] AreasTematicas { get; set; }
    }
}
