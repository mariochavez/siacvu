namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ProyectoForm
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Responsable { get; set; }
        public string ProductoEsperado { get; set; }
        public bool ConFinanciamiento { get; set; }
        public int EstadoProyecto { get; set; }
        public string Objetivos { get; set; }
        //public bool ProyectoConvenio { get; set; }
        //public string ObjetivoGeneral { get; set; }
        //public string ImpactoAcademico { get; set; }
        //public string OtroImpacto { get; set; }
        //public string UsuariosPotenciales { get; set; }
        //public string BeneficiariosProyecto { get; set; }
        //public int Monto { get; set; }
        //public bool ServicioUSEG { get; set; }
        //public string NombreEstudiante { get; set; }
        //public int TipoEstudiante { get; set; }
        //public bool IncluirWeb { get; set; }
        //public string Entidad { get; set; }
        //public string OtraEmpresaInstitucionParticipante { get; set; }
        //public string BecarioParticipante { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        public string FechaInicial { get; set; }
        public string FechaFinal { get; set; }
        public string FechaRegistro { get; set; }
        public string FechaTramite { get; set; }
        //public string FechaEntregaCompromiso { get; set; }
        //public string FechaEntregaProducto { get; set; }

        //Espacio para Agregar Mapeos
        public int TipoProyecto { get; set; }
        public int TipoProyectoId { get; set; }

        public int LineaTematica { get; set; }
        public int LineaTematicaId { get; set; }

        public int Coordinacion { get; set; }
        public int CoordinacionId { get; set; }

        //public int Convenio { get; set; }
        //public int ConvenioId { get; set; }

        //public int Sede { get; set; }
        //public int SedeId { get; set; }

        //public int ImpactoPoliticaPublica { get; set; }
        //public int ImpactoPoliticaPublicaId { get; set; }

        //public int Ambito { get; set; }
        //public int AmbitoId { get; set; }

        //public int TipoFinanciamiento { get; set; }
        //public int TipoFinanciamientoId { get; set; }

        //public int Moneda { get; set; }
        //public int MonedaId { get; set; }

        //public int SectorFinanciamiento { get; set; }
        //public int SectorFinanciamientoId { get; set; }

        //public int ProductoAcademico { get; set; }
        //public int ProductoAcademicoId { get; set; }

        //public int ActividadPrevista { get; set; }
        //public int ActividadPrevistaId { get; set; }

        //public int USEG { get; set; }
        //public int USEGId { get; set; }

        //public int Institucion { get; set; }
        //public int InstitucionId { get; set; }

        //public int NivelEstudio { get; set; }
        //public int NivelEstudioId { get; set; }

        //public int Sector { get; set; }
        //public int SectorId { get; set; }

        //public int Organizacion { get; set; }
        //public int OrganizacionId { get; set; }

        //public int Nivel2 { get; set; }
        //public int Nivel2Id { get; set; }

        //public int Nivel3 { get; set; }
        //public int Nivel3Id { get; set; }

        //public int Nivel4 { get; set; }
        //public int Nivel4Id { get; set; }

        //public int Nivel5 { get; set; }
        //public int Nivel5Id { get; set; }

        //public int Nivel6 { get; set; }
        //public int Nivel6Id { get; set; }

        //public int Departamento { get; set; }
        //public int DepartamentoId { get; set; }

        //public int Area { get; set; }
        //public int AreaId { get; set; }

        //public int Disciplina { get; set; }
        //public int DisciplinaId { get; set; }

        //public int Subdisciplina { get; set; }
        //public int SubdisciplinaId { get; set; }

        /* New */
        public ResponsableInternoProyectoForm[] ResponsableInternoProyectos { get; set; }
        public ResponsableInternoProyectoForm ResponsableInternoProyecto { get; set; }

        public ResponsableExternoProyectoForm[] ResponsableExternoProyectos { get; set; }
        public ResponsableExternoProyectoForm ResponsableExternoProyecto { get; set; }

        public ParticipanteInternoProyectoForm[] ParticipanteInternoProyectos { get; set; }
        public ParticipanteInternoProyectoForm ParticipanteInternoProyecto { get; set; }

        public ParticipanteExternoProyectoForm[] ParticipanteExternoProyectos { get; set; }
        public ParticipanteExternoProyectoForm ParticipanteExternoProyecto { get; set; }

        /* Catalogos */
        public CoordinacionForm[] Coordinaciones { get; set; }
        public TipoProyectoForm[] TiposProyectos { get; set; }
        //public ConvenioForm[] Convenios { get; set; }
        public InvestigadorForm[] ResponsablesInternos { get; set; }
        public InvestigadorExternoForm[] ResponsablesExternos { get; set; }
        public InvestigadorForm[] ParticipantesInternos { get; set; }
        public InvestigadorExternoForm[] ParticipantesExternos { get; set; }
        //public SedeForm[] Sedes { get; set; }
        public LineaTematicaForm[] LineasTematicas { get; set; }
        //public ImpactoPoliticaPublicaForm[] ImpactosPoliticasPublicas { get; set; }
        //public AmbitoForm[] Ambitos { get; set; }
        //public TipoFinanciamientoForm[] TiposFinanciamientos { get; set; }
        //public MonedaForm[] Monedas { get; set; }
        //public SectorFinanciamientoForm[] SectoresFinanciamientos { get; set; }
        //public ProductoAcademicoForm[] ProductosAcademicos { get; set; }
        //public ActividadPrevistaForm[] ActividadesPrevistas { get; set; }
        //public USEGForm[] Usegs { get; set; }
        //public InstitucionForm[] Instituciones { get; set; }
        //public NivelEstudioForm[] NivelesEstudios { get; set; }
        //public SectorForm[] Sectores { get; set; }
        //public OrganizacionForm[] Organizaciones { get; set; }
        //public NivelForm[] Niveles2 { get; set; }
        //public NivelForm[] Niveles3 { get; set; }
        //public NivelForm[] Niveles4 { get; set; }
        //public NivelForm[] Niveles5 { get; set; }
        //public NivelForm[] Niveles6 { get; set; }
        //public DepartamentoForm[] Departamentos { get; set; }
        //public AreaForm[] Areas { get; set; }
        //public DisciplinaForm[] Disciplinas { get; set; }
        //public SubdisciplinaForm[] Subdisciplinas { get; set; }
    }
}