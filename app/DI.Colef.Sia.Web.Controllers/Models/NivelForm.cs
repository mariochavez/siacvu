namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class NivelForm
    {		
		public int Id { get; set; }
		public string Nombre { get; set; }
		public bool Activo { get; set; }
		public string Modificacion { get; set; }

        public int NivelReferencia { get; set; }
        public int NivelReferenciaId { get; set; }

        public int Organizacion { get; set; }
        public int OrganizacionId { get; set; }

        public NivelForm[] Niveles { get; set; }
        public OrganizacionForm[] Organizaciones { get; set; }
    }
}
