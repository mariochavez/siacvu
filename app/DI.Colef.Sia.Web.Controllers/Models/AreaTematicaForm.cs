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
        public string LineaTematicaNombre { get; set; }

        public int Subdisciplina { get; set; }
        public int SubdisciplinaId { get; set; }
        public string SubdisciplinaNombre { get; set; }
        public string SubdisciplinaDisciplinaNombre { get; set; }
        public string SubdisciplinaDisciplinaAreaNombre { get; set; }

        public SubdisciplinaForm[] Subdisciplinas { get; set; }
        public LineaTematicaForm[] LineasTematicas { get; set; }
    }
}
