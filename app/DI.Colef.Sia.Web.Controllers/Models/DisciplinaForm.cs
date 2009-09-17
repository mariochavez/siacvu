namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class DisciplinaForm
    {		
		public int Id { get; set; }
		public string Nombre { get; set; }
		public bool Activo { get; set; }
		public string Modificacion { get; set; }

        public int Area { get; set; }
        public int AreaId { get; set; }

        public AreaForm[] Areas { get; set; }
    }
}
