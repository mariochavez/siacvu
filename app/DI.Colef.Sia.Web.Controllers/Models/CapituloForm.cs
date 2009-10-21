namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class CapituloForm
    {
		public int Id { get; set; }
		public string NombreCapitulo { get; set; }
		public string FechaAceptacion { get; set; }
		public string FechaEdicion { get; set; }
		public string NombreLibro { get; set; }
		public int NoPaginas { get; set; }
		public string AutorLibro { get; set; }
        public bool Traductor { get; set; }
        public string FechaPublicacion { get; set; }
		public string Resumen { get; set; }
		public bool Activo { get; set; }
		public string Modificacion { get; set; }
        public int PosicionAutor { get; set; }
        public bool TieneProyecto { get; set; }
        public string DepartamentoNombre { get; set; }
        public string SedeNombre { get; set; }
        public int Volumen { get; set; }

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

        public int TipoParticipacion { get; set; }
        public int TipoParticipacionId { get; set; }
        public string TipoParticipacionNombre { get; set; }

        public int TipoParticipante { get; set; }
        public int TipoParticipanteId { get; set; }
        public string TipoParticipanteNombre { get; set; }

        //public string AreaNombre { get; set; }
        //public string DisciplinaNombre { get; set; }
        //public int Subdisciplina { get; set; }
        //public int SubdisciplinaId { get; set; }
        //public string SubdisciplinaNombre { get; set; }

        public int ProyectoId { get; set; }
        public string ProyectoNombre { get; set; }
        public string ProyectoAreaTematicaLineaTematicaNombre { get; set; }
        public string ProyectoAreaTematicaNombre { get; set; }
        public string ProyectoAreaTematicaSubdisciplinaDisciplinaAreaNombre { get; set; }
        public string ProyectoAreaTematicaSubdisciplinaDisciplinaNombre { get; set; }
        public string ProyectoAreaTematicaSubdisciplinaNombre { get; set; }

        public int AreaTematicaId { get; set; }
        public string AreaTematicaNombre { get; set; }
        public string AreaTematicaLineaTematicaNombre { get; set; }
        public string AreaTematicaSubdisciplinaNombre { get; set; }
        public string AreaTematicaSubdisciplinaDisciplinaNombre { get; set; }
        public string AreaTematicaSubdisciplinaDisciplinaAreaNombre { get; set; }

        public int Editorial { get; set; }
        public int EditorialId { get; set; }
        public string EditorialNombre { get; set; }

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

        /* Show */
        public ShowFieldsForm ShowFields { get; set; }
        public ProyectoForm Proyecto { get; set; }
        public AreaTematicaForm AreaTematica { get; set; }

		/* Catalogos */
        public CustomSelectForm[] Volumenes { get; set; }
        public EditorialForm[] Editoriales { get; set; }
        public AreaTematicaForm[] AreasTematicas { get; set; }
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
        public ProyectoForm[] Proyectos { get; set; }
    }
}