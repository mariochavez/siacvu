namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class OrganizacionForm
    {		
		public int Id { get; set; }
		public string Nombre { get; set; }
		public bool Activo { get; set; }
		public string Modificacion { get; set; }

        public int Sector { get; set; }
        public int SectorId { get; set; }

        public SectorForm[] Sectores { get; set; }

        public string CodigoConacyt { get; set; }
    }
}
