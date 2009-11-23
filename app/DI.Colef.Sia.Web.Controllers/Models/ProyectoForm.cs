namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ProyectoForm
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public bool ConRecursos { get; set; }
        public bool ConConvenio { get; set; }
        public string ObjetivoGeneral { get; set; }
        public string PalabraClave1 { get; set; }
        public string PalabraClave2 { get; set; }
        public string PalabraClave3 { get; set; }
        public string ImpactoAcademicoEsperado { get; set; }
        public string UsuariosPotenciales { get; set; }
        public string PosiblesBeneficiarios { get; set; }
        public bool RequiereServicioUSEG { get; set; }
        public bool ParticipaEstudiante { get; set; }
        public string NombreEstudiante { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        public string FechaInicial { get; set; }
        public string FechaFinal { get; set; }
        public string FechaProrroga { get; set; }
        public string FechaConclusion { get; set; }
        public string FechaEntregaProducto { get; set; }

        //Espacio para Agregar Mapeos
        public int TipoProyecto { get; set; }
        public int TipoProyectoId { get; set; }
        public string TipoProyectoNombre { get; set; }

        public int Convenio { get; set; }
        public int ConvenioId { get; set; }
        public string ConvenioNombre { get; set; }

        public int EstatusProyecto { get; set; }
        public int EstatusProyectoId { get; set; }
        public string EstatusProyectoNombre { get; set; }

        public int SectorFinanciamiento { get; set; }
        public int SectorFinanciamientoId { get; set; }
        public string SectorFinanciamientoNombre { get; set; }

        public int FondoConacyt { get; set; }
        public int FondoConacytId { get; set; }
        public string FondoConacytNombre { get; set; }

        public int LineaTematica { get; set; }
        public int LineaTematicaId { get; set; }
        public string LineaTematicaNombre { get; set; }

        public int AreaTematica { get; set; }
        public int AreaTematicaId { get; set; }
        public string AreaTematicaNombre { get; set; }
        public string AreaTematicaLineaTematicaNombre { get; set; }
        public string AreaTematicaSubdisciplinaDisciplinaAreaNombre { get; set; }
        public string AreaTematicaSubdisciplinaDisciplinaNombre { get; set; }
        public string AreaTematicaSubdisciplinaNombre { get; set; }

        public int ImpactoPoliticaPublica { get; set; }
        public int ImpactoPoliticaPublicaId { get; set; }
        public string ImpactoPoliticaPublicaNombre { get; set; }

        public int USEG { get; set; }
        public int USEGId { get; set; }
        public string USEGNombre { get; set; }

        public int ProductoAcademico { get; set; }
        public int ProductoAcademicoId { get; set; }
        public string ProductoAcademicoNombre { get; set; }

        public int ActividadPrevista { get; set; }
        public int ActividadPrevistaId { get; set; }
        public string ActividadPrevistaNombre { get; set; }

        public int TipoEstudiante { get; set; }

        public int GradoAcademico { get; set; }
        public int GradoAcademicoId { get; set; }
        public string GradoAcademicoNombre { get; set; }

        //public int Nivel2 { get; set; }
        public int Nivel2Id { get; set; }
        public string Nivel2Nombre { get; set; }

        //public int Subdisciplina { get; set; }
        public int SubdisciplinaId { get; set; }
        public string SubdisciplinaNombre { get; set; }

        //public int Clase { get; set; }
        public int ClaseId { get; set; }
        public string ClaseNombre { get; set; }

        /*Show*/
        public ShowFieldsForm ShowFields { get; set; }
        public ClaseForm Clase { get; set; }
        public SubdisciplinaForm Subdisciplina { get; set; }
        public NivelForm Nivel2 { get; set; }

        /* New */
        public ResponsableInternoProyectoForm[] ResponsableInternoProyectos { get; set; }
        public ResponsableInternoProyectoForm ResponsableInternoProyecto { get; set; }

        public ParticipanteInternoProyectoForm[] ParticipanteInternoProyectos { get; set; }
        public ParticipanteInternoProyectoForm ParticipanteInternoProyecto { get; set; }

        public ParticipanteExternoProyectoForm[] ParticipanteExternoProyectos { get; set; }
        public ParticipanteExternoProyectoForm ParticipanteExternoProyecto { get; set; }

        public RecursoFinancieroProyectoForm[] RecursoFinancieroProyectos { get; set; }
        public RecursoFinancieroProyectoForm RecursoFinancieroProyecto { get; set; }

        /* Catalogos */
        public TipoProyectoForm[] TiposProyectos { get; set; }
        public InvestigadorForm[] ResponsablesInternos { get; set; }
        public InvestigadorForm[] ParticipantesInternos { get; set; }
        public InvestigadorExternoForm[] ParticipantesExternos { get; set; }
        public MonedaForm[] Monedas { get; set; }
        public InstitucionForm[] Instituciones { get; set; }
        public ConvenioForm[] Convenios { get; set; }
        public EstatusProyectoForm[] EstatusProyectos { get; set; }
        public SectorForm[] SectoresFinanciamientos { get; set; }
        public FondoConacytForm[] FondosConacyt { get; set; }
        public AreaTematicaForm[] AreasTematicas { get; set; }
        public LineaTematicaForm[] LineasTematicas { get; set; }
        public ImpactoPoliticaPublicaForm[] ImpactosPoliticasPublicas { get; set; }
        public USEGForm[] Usegs { get; set; }
        public ProductoAcademicoForm[] ProductosAcademicos { get; set; }
        public ActividadPrevistaForm[] ActividadesPrevistas { get; set; }
        public CustomSelectForm[] TiposEstudiantes { get; set; }
        public GradoAcademicoForm[] GradosAcademicos { get; set; }
        public NivelForm[] Niveles2 { get; set; }
        public SubdisciplinaForm[] Subdisciplinas { get; set; }
        public ClaseForm[] Clases { get; set; }
    }
}