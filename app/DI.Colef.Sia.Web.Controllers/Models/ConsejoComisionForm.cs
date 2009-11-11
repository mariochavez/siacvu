namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ConsejoComisionForm
    {		
		public int Id { get; set; }
		public string Nombre { get; set; }
		public int Duracion { get; set; }
		public bool Reeleccion { get; set; }
		public bool Activo { get; set; }
		public string Modificacion { get; set; }
    }
}