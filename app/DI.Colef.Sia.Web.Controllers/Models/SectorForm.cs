namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class SectorForm
    {		
		public int Id { get; set; }
		public string Nombre { get; set; }
		public bool Activo { get; set; }
		public string Modificacion { get; set; }

        public int TipoSector { get; set; }

        public CustomSelectForm[] TiposSectores { get; set; }
    }
}
