namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class GrupoInvestigacionForm : BaseForm
    {
		public string NombreGrupoInvestigacion { get; set; }
		public string FechaCreacion { get; set; }
        public bool Lider { get; set; }
        public string NombreLider { get; set; }
        public string Impacto { get; set; }
        public string VinculacionSectorProductivo { get; set; }
        public string VinculacionSectorSocial { get; set; }
        public string Colaboracion { get; set; }
        public string Administracion { get; set; }
        public string ProgramaRegistrado { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        public bool CoautorSeOrdenaAlfabeticamente { get; set; }
        public bool AutorSeOrdenaAlfabeticamente { get; set; }
        public int PosicionAutor { get; set; }

        public int SectorId { get; set; }
        public int OrganizacionId { get; set; }
        public int Nivel2Id { get; set; }

        public string SectorNombre { get; set; }
        public string OrganizacionNombre { get; set; }
        public string Nivel2Nombre { get; set; }

        public CoautorExternoProductoForm[] MiembroExternoGrupoInvestigaciones { get; set; }
        public CoautorInternoProductoForm[] MiembroInternoGrupoInvestigaciones { get; set; }

        /* New */
        public CoautorExternoProductoForm CoautorExternoProducto { get; set; }
        public CoautorExternoProductoForm CoautorInternoProducto { get; set; }

        /*Show*/
        public ShowFieldsForm ShowFields { get; set; }

        public SectorForm[] Sectores { get; set; }
        public OrganizacionForm[] Organizaciones { get; set; }
        public NivelForm[] Niveles { get; set; }
    }
}
