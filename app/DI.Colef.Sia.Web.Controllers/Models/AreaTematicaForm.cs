namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class AreaTematicaForm
    {		
		public int Id { get; set; }
		public string Nombre { get; set; }
		public bool Activo { get; set; }
		public string Modificacion { get; set; }

        public int LineaTematica { get; set; }
        public int LineaTematicaId { get; set; }

        public LineaTematicaForm[] LineasTematicas { get; set; }
    }
}
