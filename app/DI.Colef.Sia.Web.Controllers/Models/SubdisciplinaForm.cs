namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class SubdisciplinaForm
    {		
		public int Id { get; set; }
		public string Nombre { get; set; }
		public bool Activo { get; set; }
		public string Modificacion { get; set; }

        public int Disciplina { get; set; }
        public int DisciplinaId { get; set; }

        public DisciplinaForm[] Disciplinas { get; set; }

        public string DisciplinaNombre { get; set; }

        public string DisciplinaAreaNombre { get; set; }

        public string CodigoConacyt { get; set; }

        public int DisciplinaAreaId { get; set; }
    }
}
