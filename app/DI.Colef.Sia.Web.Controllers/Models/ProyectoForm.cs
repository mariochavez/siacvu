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
        public int TipoEstudianteId { get; set; }
        public string TipoEstudianteNombre { get; set; }

        public int GradoAcademico { get; set; }
        public int GradoAcademicoId { get; set; }
        public string GradoAcademicoNombre { get; set; }

        public int Sector { get; set; }
        public int SectorId { get; set; }
        public string SectorNombre { get; set; }

        public int Organizacion { get; set; }
        public int OrganizacionId { get; set; }
        public string OrganizacionNombre { get; set; }

        public int Nivel2 { get; set; }
        public int Nivel2Id { get; set; }
        public string Nivel2Nombre { get; set; }

        public int Nivel3 { get; set; }
        public int Nivel3Id { get; set; }
        public string Nivel3Nombre { get; set; }

        public int Nivel4 { get; set; }
        public int Nivel4Id { get; set; }
        public string Nivel4Nombre { get; set; }

        public int Nivel5 { get; set; }
        public int Nivel5Id { get; set; }
        public string Nivel5Nombre { get; set; }

        public int Nivel6 { get; set; }
        public int Nivel6Id { get; set; }
        public string Nivel6Nombre { get; set; }

        public int Area { get; set; }
        public int AreaId { get; set; }
        public string AreaNombre { get; set; }

        public int Disciplina { get; set; }
        public int DisciplinaId { get; set; }
        public string DisciplinaNombre { get; set; }

        public int Subdisciplina { get; set; }
        public int SubdisciplinaId { get; set; }
        public string SubdisciplinaNombre { get; set; }

        public int SectorEconomico { get; set; }
        public int SectorEconomicoId { get; set; }
        public string SectorEconomicoNombre { get; set; }

        public int Rama { get; set; }
        public int RamaId { get; set; }
        public string RamaNombre { get; set; }

        public int Clase { get; set; }
        public int ClaseId { get; set; }
        public string ClaseNombre { get; set; }

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
        public TipoEstudianteForm[] TiposEstudiantes { get; set; }
        public GradoAcademicoForm[] GradosAcademicos { get; set; }
        public SectorForm[] Sectores { get; set; }
        public OrganizacionForm[] Organizaciones { get; set; }
        public NivelForm[] Niveles2 { get; set; }
        public NivelForm[] Niveles3 { get; set; }
        public NivelForm[] Niveles4 { get; set; }
        public NivelForm[] Niveles5 { get; set; }
        public NivelForm[] Niveles6 { get; set; }
        public AreaForm[] Areas { get; set; }
        public DisciplinaForm[] Disciplinas { get; set; }
        public SubdisciplinaForm[] Subdisciplinas { get; set; }
        public SectorForm[] SectoresEconomicos { get; set; }
        public RamaForm[] Ramas { get; set; }
        public ClaseForm[] Clases { get; set; }


        ///Campos Prototipo
        //public string Responsable { get; set; }
        //public string ProductoEsperado { get; set; }
        //public string FechaRegistro { get; set; }
        //public string FechaTramite { get; set; }
        //public int Coordinacion { get; set; }
        //public int CoordinacionId { get; set; }
        //public string CoordinacionNombre { get; set; }
        //public CoordinacionForm[] Coordinaciones { get; set; }

        ///Campos Nunca Usados
        //public string OtroImpacto { get; set; }
        //public int Monto { get; set; }
        //public bool IncluirWeb { get; set; }
        //public string Entidad { get; set; }
        //public string OtraEmpresaInstitucionParticipante { get; set; }
        //public string FechaEntregaCompromiso { get; set; }
        //public int Sede { get; set; }
        //public int SedeId { get; set; }
        //public int Ambito { get; set; }
        //public int AmbitoId { get; set; }
        //public int TipoFinanciamiento { get; set; }
        //public int TipoFinanciamientoId { get; set; }
        //public int Moneda { get; set; }
        //public int MonedaId { get; set; }
        //public int Institucion { get; set; }
        //public int InstitucionId { get; set; }
        //public int NivelEstudio { get; set; }
        //public int NivelEstudioId { get; set; }
        //public int Departamento { get; set; }
        //public int DepartamentoId { get; set; }
        //public SedeForm[] Sedes { get; set; }
        //public AmbitoForm[] Ambitos { get; set; }
        //public TipoFinanciamientoForm[] TiposFinanciamientos { get; set; }
        //public MonedaForm[] Monedas { get; set; }
        //public InstitucionForm[] Instituciones { get; set; }
        //public NivelEstudioForm[] NivelesEstudios { get; set; }
        //public DepartamentoForm[] Departamentos { get; set; }
    }
}