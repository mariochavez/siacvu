namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class InstitucionForm
    {		
		public int Id { get; set; }
		public string Nombre { get; set; }
		public string Siglas { get; set; }
        public string Sede { get; set; }
        public string PaginaWeb { get; set; }
		public string Email { get; set; }
        public string Telefono { get; set; }
        public string AgrupaInstitucion { get; set; }
        public bool TipoInstitucion { get; set; }
        public string Ciudad { get; set; }
		public bool Activo { get; set; }
		public string Modificacion { get; set; }

        public int Pais { get; set; }
        public int PaisId { get; set; }
        public string PaisNombre { get; set; }

        public int EstadoPais { get; set; }
        public int EstadoPaisId { get; set; }
        public string EstadoPaisNombre { get; set; }

        public int Ambito { get; set; }
        public int AmbitoId { get; set; }
        public string AmbitoNombre { get; set; }

        public int Sector { get; set; }
        public int SectorId { get; set; }
        public string SectorNombre { get; set; }

        // Catalogos
        public PaisForm[] Paises { get; set; }
        public EstadoPaisForm[] EstadosPaises { get; set; }
        public AmbitoForm[] Ambitos { get; set; }
        public SectorForm[] Sectores { get; set; }
    }
}