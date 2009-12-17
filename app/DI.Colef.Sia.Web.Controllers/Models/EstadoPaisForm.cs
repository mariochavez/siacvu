namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class EstadoPaisForm
    {		
		public int Id { get; set; }
		public string Nombre { get; set; }
		public bool Activo { get; set; }
		public string Modificacion { get; set; }

        public int Pais { get; set; }
        public int PaisId { get; set; }

        public PaisForm[] Paises { get; set; }
    }
}
