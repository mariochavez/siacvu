namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class CapituloForm
    {
		public int Id { get; set; }
		public string NombreCapitulo { get; set; }
		public string FechaAceptacion { get; set; }
		public string FechaEdicion { get; set; }
		public string NombreLibro { get; set; }
		public string Editorial { get; set; }
		public int NoPaginas { get; set; }
		public string Volumen { get; set; }
		public string AutorLibro { get; set; }
        public bool Traductor { get; set; }
        public string FechaPublicacion { get; set; }
		public string Resumen { get; set; }
		public bool Activo { get; set; }
		public string Modificacion { get; set; }
        public int PosicionAutor { get; set; }
        public bool TieneProyecto { get; set; }
        public string AnioAceptacion { get; set; }
        public string DepartamentoNombre { get; set; }
        public string SedeNombre { get; set; }

        public string InstitucionNombre { get; set; }
        public int InstitucionId { get; set; }

        public int TipoCapitulo { get; set; }
        public int TipoCapituloId { get; set; }
        public string TipoCapituloNombre { get; set; }

        public int EstadoProducto { get; set; }
        public int EstadoProductoId { get; set; }
        public string EstadoProductoNombre { get; set; }

        public int Idioma { get; set; }
        public int IdiomaId { get; set; }
        public string IdiomaNombre { get; set; }

        public int Pais { get; set; }
        public int PaisId { get; set; }
        public string PaisNombre { get; set; }

        public int FormaParticipacion { get; set; }
        public int FormaParticipacionId { get; set; }
        public string FormaParticipacionNombre { get; set; }

        public int TipoParticipacion { get; set; }
        public int TipoParticipacionId { get; set; }
        public string TipoParticipacionNombre { get; set; }

        public int TipoParticipante { get; set; }
        public int TipoParticipanteId { get; set; }
        public string TipoParticipanteNombre { get; set; }

        public int Area { get; set; }
        public int AreaId { get; set; }
        public string AreaNombre { get; set; }

        public int Disciplina { get; set; }
        public int DisciplinaId { get; set; }
        public string DisciplinaNombre { get; set; }

        public int Subdisciplina { get; set; }
        public int SubdisciplinaId { get; set; }
        public string SubdisciplinaNombre { get; set; }

        public int ProyectoId { get; set; }
        public string ProyectoNombre { get; set; }
        public string ProyectoLineaTematicaNombre { get; set; }
        public string ProyectoAreaTematicaNombre { get; set; }

        public string PeriodoReferenciaPeriodo { get; set; }
        public int TotalAutores
        {
            get
            {
                return (CoautorExternoCapitulos == null ? 0 : CoautorExternoCapitulos.Length) +
                    (CoautorInternoCapitulos == null ? 0 : CoautorInternoCapitulos.Length) + 1;
            }
        }

        public int TotalEditores
        {
            get
            {
                return (ResponsableExternoCapitulos == null ? 0 : ResponsableExternoCapitulos.Length) +
                       (ResponsableInternoCapitulos == null ? 0 : ResponsableInternoCapitulos.Length);
            }
        }

        public CoautorExternoProductoForm[] CoautorExternoCapitulos { get; set; }
        public CoautorInternoProductoForm[] CoautorInternoCapitulos { get; set; }
        public ResponsableInternoProductoForm[] ResponsableInternoCapitulos { get; set; }
        public ResponsableExternoProductoForm[] ResponsableExternoCapitulos { get; set; }
		
		/* New */
		public CoautorExternoProductoForm CoautorExternoProducto { get; set; }
        public CoautorInternoProductoForm CoautorInternoProducto { get; set; }
        public ResponsableInternoProductoForm ResponsableInternoProducto { get; set; }
        public ResponsableExternoProductoForm ResponsableExternoProducto { get; set; }
		
		/* Catalogos */
        public TipoCapituloForm[] TiposCapitulos { get; set; }
        public EstadoProductoForm[] EstadosProductos { get; set; }
		public IdiomaForm[] Idiomas { get; set; }
		public InvestigadorExternoForm[] CoautoresExternos { get; set; }
        public InvestigadorForm[] CoautoresInternos { get; set; }
		public PaisForm[] Paises { get; set; }
        public InvestigadorForm[] ResponsablesInternos { get; set; }
        public InvestigadorExternoForm[] ResponsablesExternos { get; set; }
		public FormaParticipacionForm[] FormasParticipaciones { get; set; }
		public TipoParticipacionForm[] TiposParticipaciones { get; set; }
		public TipoParticipanteForm[] TiposParticipantes { get; set; }
		public AreaForm[] Areas { get; set; }
		public DisciplinaForm[] Disciplinas { get; set; }
		public SubdisciplinaForm[] Subdisciplinas { get; set; }
        public ProyectoForm[] Proyectos { get; set; }
    }
}