using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class GrupoInvestigacionForm
    {
		public int Id { get; set; }
		public string NombreGrupoInvestigacion { get; set; }
		public string FechaCreacion { get; set; }
        public bool Lider { get; set; }
        public string Impacto { get; set; }
        public string VinculacionSectorProductivo { get; set; }
        public string VinculacionSectorSocial { get; set; }
        public string Colaboracion { get; set; }
        public string Administracion { get; set; }
        public string ProgramaRegistrado { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        public Investigador Investigador { get; set; }

        public string Nombre
        {
            get
            {
                return string.Format("{0} {1} {2}", Investigador.Usuario.Nombre,
                                     Investigador.Usuario.ApellidoPaterno, Investigador.Usuario.ApellidoMaterno);
            }
        }

        public int SectorId { get; set; }
        public int OrganizacionId { get; set; }
        public int Nivel2Id { get; set; }

        public string SectorNombre { get; set; }
        public string OrganizacionNombre { get; set; }
        public string Nivel2Nombre { get; set; }

        public MiembroExternoGrupoInvestigacionForm[] MiembroExternoGrupoInvestigaciones { get; set; }

        /* New */
        public MiembroExternoGrupoInvestigacionForm[] MiembroExternoGrupoInvestigacion { get; set; }

        /*Show*/
        public ShowFieldsForm ShowFields { get; set; }

        public SectorForm[] Sectores { get; set; }
        public OrganizacionForm[] Organizaciones { get; set; }
        public NivelForm[] Niveles { get; set; }
    }
}
