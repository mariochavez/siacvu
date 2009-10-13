namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class AutorResenaForm
    {
		public int Id { get; set; }
		public bool Activo { get; set; }
		public string Modificacion { get; set; }

        public int Investigador { get; set; }
        public int InvestigadorId { get; set; }
        public string InvestigadorUsuarioNombre { get; set; }

        public int ParentId { get; set; }
    }
}