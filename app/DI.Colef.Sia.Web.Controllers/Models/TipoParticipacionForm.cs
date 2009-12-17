namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class TipoParticipacionForm
    {		
		public int Id { get; set; }
		public string Nombre { get; set; }
		public bool Activo { get; set; }
		public string Modificacion { get; set; }

        public int Tipo { get; set; }

        public CustomSelectForm[] TiposParticipaciones { get; set; }
    }
}
