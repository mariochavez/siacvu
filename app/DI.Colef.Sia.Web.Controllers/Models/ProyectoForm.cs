using System;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ProyectoForm
    {
        public int Id { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        public int FirmaAceptacion2 { get; set; }
        public string FirmaDescripcion { get; set; }

        //Seccion Informacion General
        public string Nombre { get; set; }

        public int TipoProyecto { get; set; }
        public int TipoProyectoId { get; set; }

        public string TipoProyectoNombre { get; set; }
        public TipoProyectoForm[] TiposProyectos { get; set; }

        //Seccion Investigadores participantes
        public ResponsableProyectoForm[] ResponsableProyectos { get; set; }
        public ResponsableProyectoForm ResponsableProyecto { get; set; }

        //Seccion Calendario del proyecto
        public string FechaInicial { get; set; }
        public string FechaFinal { get; set; }
        public string FechaProrroga { get; set; }

        public int EstadoProyecto { get; set; }
        public CustomSelectForm[] EstatusProyectos { get; set; }

        public string FechaConclusion { get; set; }
        public string ComprobanteCalendarioProyectoNombre { get; set; }
        public int ComprobanteCalendarioProyectoId { get; set; }

        //Seccion fuentes del financiamiento del proyecto
        public bool ConRecursos { get; set; }
        public virtual bool ConConvenio { get; set; }

        public int Convenio { get; set; }
        public int ConvenioId { get; set; }
        public string ConvenioNombre { get; set; }
        public string ConvenioFechaFirma { get; set; }
        public string ConvenioFechaConclusion { get; set; }
        public string ConvenioTerminoReferencia { get; set; }
        public string ConvenioProductoComprometido { get; set; }

        public ConvenioForm[] Convenios { get; set; }

        public int SectorFinanciamiento { get; set; }
        public int SectorFinanciamientoId { get; set; }
        public string SectorFinanciamientoNombre { get; set; }

        public SectorForm[] SectoresFinanciamientos { get; set; }

        public int FondoConacyt { get; set; }
        public int FondoConacytId { get; set; }
        public string FondoConacytNombre { get; set; }

        public FondoConacytForm[] FondosConacyt { get; set; }

        //Seccion Recursos Financieros
        public RecursoFinancieroProyectoForm[] RecursoFinancieroProyectos { get; set; }
        public RecursoFinancieroProyectoForm RecursoFinancieroProyecto { get; set; }
        public MonedaForm[] Monedas { get; set; }

        //Seccion Tematica del proyecto
        public string ObjetivoGeneral { get; set; }

        public int AreaTematicaId { get; set; }
        public string AreaTematicaNombre { get; set; }
        public string AreaTematicaLineaTematicaNombre { get; set; }

        public int ImpactoPoliticaPublica { get; set; }

        public CustomSelectForm[] ImpactoPuliticaPublicas { get; set; }

        public int VinculacionAPyD { get; set; }
        public int VinculacionAPyDId { get; set; }
        public string VinculacionAPyDNombre { get; set; }

        public VinculacionAPyDForm[] VinculacionesAPyDs { get; set; }

        public string ResumenProyecto { get; set; }
        public string ComprobanteTematicaProyectoNombre { get; set; }
        public int ComprobanteTematicaProyectoId { get; set; }

        //Area Conocimiento
        public int AreaId { get; set; }
        public int DisciplinaId { get; set; }
        public int SubdisciplinaId { get; set; }

        public string AreaNombre { get; set; }
        public string DisciplinaNombre { get; set; }
        public string SubdisciplinaNombre { get; set; }

        public AreaForm[] Areas { get; set; }
        public DisciplinaForm[] Disciplinas { get; set; }
        public SubdisciplinaForm[] Subdisciplinas { get; set; }

        //Seccion Productos academicos contemplados
        public string Actividades { get; set; }
        public string ProductoAcademicoEsperado { get; set; }

        //Seccion participacion de estudiantes/becarios
        public bool ParticipaEstudiante { get; set; }
        public EstudianteProyectoForm[] EstudianteProyectos { get; set; }
        public EstudianteProyectoForm EstudianteProyecto { get; set; }
        public GradoAcademicoForm[] GradosAcademicos { get; set; }
        public CustomSelectForm[] TiposEstudiantes { get; set; }

        //Estructura Funcional
        public int SectorId { get; set; }
        public int OrganizacionId { get; set; }
        public int Nivel2Id { get; set; }

        public string SectorNombre { get; set; }
        public string OrganizacionNombre { get; set; }
        public string Nivel2Nombre { get; set; }

        public SectorForm[] Sectores { get; set; }
        public OrganizacionForm[] Organizaciones { get; set; }
        public NivelForm[] Niveles { get; set; }

        //Actividad Economica
        public int SectorEconomicoId { get; set; }
        public int RamaId { get; set; }
        public int ClaseId { get; set; }

        public string SectorEconomicoNombre { get; set; }
        public string RamaNombre { get; set; }
        public string ClaseNombre { get; set; }

        public SectorForm[] SectoresEconomicos { get; set; }
        public RamaForm[] Ramas { get; set; }
        public ClaseForm[] Clases { get; set; }

        //Seccion Productos generados del proyecto
        public ProductoGeneradoProyectoForm[] ProductoGeneradoProyectos { get; set; }
        public ProductoGeneradoProyectoForm ProductoGeneradoProyecto { get; set; }
        public CustomSelectForm[] ProductosGenerados { get; set; }

        /*Show*/
        public ShowFieldsForm ShowFields { get; set; }
        public AreaTematicaForm AreaTematica { get; set; }

        public ParticipanteInternoProductoForm[] ParticipanteInternoProyectos { get; set; }
        public ParticipanteInternoProductoForm ParticipanteInternoProducto { get; set; }

        public ParticipanteExternoProductoForm[] ParticipanteExternoProyectos { get; set; }
        public ParticipanteExternoProductoForm ParticipanteExternoProducto { get; set; }

        public string UsuarioNombre { get; set; }
        public string UsuarioApellidoPaterno { get; set; }
        public string UsuarioApellidoMaterno { get; set; }

        public string InvestigadorNombre1 { get; private set; }
        public string InvestigadorNombre
        {
            get { return string.Format("{0} {1} {2}", UsuarioApellidoPaterno, UsuarioApellidoMaterno, UsuarioNombre); }
            set { InvestigadorNombre1 = value; }
        }

        public int TotalParticipantes
        {
            get
            {
                return (ParticipanteExternoProyectos == null ? 0 : ParticipanteExternoProyectos.Length) +
                    (ParticipanteInternoProyectos == null ? 0 : ParticipanteInternoProyectos.Length) + 1;
            }
        }

        public decimal TotalPesos
        {
            get
            {
                var pesos = new decimal();
                if (RecursoFinancieroProyectos != null)
                {
                    foreach (var recursoFinancieroProyecto in RecursoFinancieroProyectos)
                    {
                        if (recursoFinancieroProyecto.MonedaId == 1)
                        {
                            pesos += recursoFinancieroProyecto.Monto;
                        }
                    }
                }
                else
                    pesos = 0;

                return pesos;
            }
        }

        public decimal TotalDolares
        {
            get
            {
                var dolares = new decimal();
                if (RecursoFinancieroProyectos != null)
                {
                    foreach (var recursoFinancieroProyecto in RecursoFinancieroProyectos)
                    {
                        if (recursoFinancieroProyecto.MonedaId == 2)
                        {
                            dolares += recursoFinancieroProyecto.Monto;
                        }
                    }
                }
                else
                    dolares = 0;

                return dolares;
            }
        }

        public string UserRole { get; set; }
        public bool ParticipanteSeOrdenaAlfabeticamente { get; set; }
        public int PosicionParticipante { get; set; }
    }
}