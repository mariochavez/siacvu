namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class FormacionAcademicaForm
    {
        public int Id { get; set; }
        public int NumeroCedula { get; set; }
        public string TituloGrado { get; set; }
        public string FechaObtencion { get; set; }
        public string TituloTesis { get; set; }
        public string Ciudad { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        //Espacio para Agregar Mapeos
        public int NivelEstudio { get; set; }
        public int NivelEstudioId { get; set; }
        public string NivelEstudioNombre { get; set; }

        public int Estatus { get; set; }
        public int EstatusId { get; set; }
        public string EstatusNombre { get; set; }
        
        public string InstitucionNombre { get; set; }
        public int InstitucionId { get; set; }

        public string LineaTematicaNombre { get; set; }
        public int LineaTematicaId { get; set; }

        public int Pais { get; set; }
        public int PaisId { get; set; }
        public string PaisNombre { get; set; }

        public int EstadoPais { get; set; }
        public int EstadoPaisId { get; set; }
        public string EstadoPaisNombre { get; set; }

        public int SectorId { get; set; }
        public int OrganizacionId { get; set; }
        public int Nivel2Id { get; set; }

        public string SectorNombre { get; set; }
        public string OrganizacionNombre { get; set; }
        public string Nivel2Nombre { get; set; }

        public int AreaId { get; set; }
        public int DisciplinaId { get; set; }
        public int SubdisciplinaId { get; set; }

        public string SubdisciplinaNombre { get; set; }
        public string DisciplinaNombre { get; set; }
        public string AreaNombre { get; set; }

        /* Show */
        public ShowFieldsForm ShowFields { get; set; }
        public InstitucionForm Institucion { get; set; }

        /* Catalogos */
        public NivelEstudioForm[] NivelesEstudios { get; set; }
        public EstatusFormacionAcademicaForm[] EstatusFormacionAcademicas { get; set; }
        public PaisForm[] Paises { get; set; }
        public EstadoPaisForm[] EstadosPaises { get; set; }
        public AreaForm[] Areas { get; set; }
        public DisciplinaForm[] Disciplinas { get; set; }
        public SubdisciplinaForm[] Subdisciplinas { get; set; }
        public SectorForm[] Sectores { get; set; }
        public OrganizacionForm[] Organizaciones { get; set; }
        public NivelForm[] Niveles { get; set; }
    }
}
