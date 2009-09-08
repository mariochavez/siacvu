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

        public int Estatus { get; set; }
        public int EstatusId { get; set; }
        
        public string InstitucionNombre { get; set; }
        public int InstitucionId { get; set; }

        public string LineaTematicaNombre { get; set; }
        public int LineaTematicaId { get; set; }

        public int Pais { get; set; }
        public int PaisId { get; set; }

        public int EstadoPais { get; set; }
        public int EstadoPaisId { get; set; }

        public int Sector { get; set; }
        public int SectorId { get; set; }

        public int Organizacion { get; set; }
        public int OrganizacionId { get; set; }

        public int Area { get; set; }
        public int AreaId { get; set; }

        public int Disciplina { get; set; }
        public int DisciplinaId { get; set; }

        public int Subdisciplina { get; set; }
        public int SubdisciplinaId { get; set; }

        /* Catalogos */
        public NivelEstudioForm[] NivelesEstudios { get; set; }
        public EstatusFormacionAcademicaForm[] EstatusFormacionAcademicas { get; set; }
        public PaisForm[] Paises { get; set; }
        public EstadoPaisForm[] EstadosPaises { get; set; }
        public SectorForm[] Sectores { get; set; }
        public OrganizacionForm[] Organizaciones { get; set; }
        public AreaForm[] Areas { get; set; }
        public DisciplinaForm[] Disciplinas { get; set; }
        public SubdisciplinaForm[] Subdisciplinas { get; set; }
    }
}
