namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class LibroForm
    {
		public int Id { get; set; }
        public string Nombre { get; set; }
        public string ISBN { get; set; }
        public string FechaAceptacion { get; set; }
        public string FechaPublicacion { get; set; }
        public string FechaEdicion { get; set; }
        public string Volumen { get; set; }
        public string PalabraClave1 { get; set; }
        public string PalabraClave2 { get; set; }
        public string PalabraClave3 { get; set; }
        //public bool Traductor { get; set; }
        public string NombreTraductor { get; set; }
        public string Modificacion { get; set; }
        public string DepartamentoNombre { get; set; }
        public string SedeNombre { get; set; }
        public int PosicionAutor { get; set; }

        public int NoPaginas { get; set; }
        public int Numero { get; set; }
        public int Tiraje { get; set; }

        public bool Activo { get; set; }
        public bool TieneProyecto { get; set; }

		public int TipoPublicacion { get; set; }
		public int TipoPublicacionId { get; set; }
        public string TipoPublicacionNombre { get; set; }

        public int TipoProducto { get; set; }
        public int TipoProductoId { get; set; }
        public string TipoProductoNombre { get; set; }

        public int FormatoPublicacion { get; set; }
        public int FormatoPublicacionId { get; set; }
        public string FormatoPublicacionNombre { get; set; }

        public int Edicion { get; set; }
        public int EdicionId { get; set; }
        public string EdicionNombre { get; set; }

        public int Editorial { get; set; }
        public int EditorialId { get; set; }
        public string EditorialNombre { get; set; }
        public string EditorialPaisNombre { get; set; }

        public int Evento { get; set; }
        public int EventoId { get; set; }
        public string EventoNombre { get; set; }
        public string EventoFechaInicial { get; set; }
        public string EventoFechaFinal { get; set; }

        public int NombreRevistaId { get; set; }
        public string NombreRevistaTitulo { get; set; }
        public string NombreRevistaInstitucionNombre { get; set; }

		public int EstadoProducto { get; set; }
		public int EstadoProductoId { get; set; }
        public string EstadoProductoNombre { get; set; }

		public int ProyectoId { get; set; }
        public string ProyectoNombre { get; set; }
        public string ProyectoLineaTematicaNombre { get; set; }
        public string ProyectoAreaTematicaNombre { get; set; }
		
		public int Idioma { get; set; }
		public int IdiomaId { get; set; }
        public string IdiomaNombre { get; set; }

        public int Reimpresion { get; set; }
        public int ReimpresionId { get; set; }
        public string ReimpresionNombre { get; set; }

        //public int FormaParticipacion { get; set; }
        //public int FormaParticipacionId { get; set; }
        //public string FormaParticipacionNombre { get; set; }

        //public int IdentificadorLibro { get; set; }
        //public int IdentificadorLibroId { get; set; }
        //public string IdentificadorLibroNombre { get; set; }

		public int Area { get; set; }
		public int AreaId { get; set; }
        public string AreaNombre { get; set; }

		public int Disciplina { get; set; }
		public int DisciplinaId { get; set; }
        public string DisciplinaNombre { get; set; }

		public int Subdisciplina { get; set; }
		public int SubdisciplinaId { get; set; }
        public string SubdisciplinaNombre { get; set; }

        public string PeriodoReferenciaPeriodo { get; set; }
        public int TotalAutores
        {
            get
            {
                return (CoautorExternoLibros == null ? 0 : CoautorExternoLibros.Length) +
                    (CoautorInternoLibros == null ? 0 : CoautorInternoLibros.Length) + 1;
            }
        }
		
		public CoautorExternoProductoForm[] CoautorExternoLibros { get; set; }
        public CoautorInternoProductoForm[] CoautorInternoLibros { get; set; }
        public EditorialLibroForm[] EditorialLibros { get; set; }

        /* New */
        public CoautorExternoProductoForm CoautorExternoProducto { get; set; }
        public CoautorInternoProductoForm CoautorInternoProducto { get; set; }
        public EditorialLibroForm EditorialLibro { get; set; }
		
		/* Catalogos */
        public TipoPublicacionForm[] TiposPublicaciones { get; set; }
        public TipoProductoForm[] TiposProductos { get; set; }
        public FormatoPublicacionForm[] FormatosPublicaciones { get; set; }
        public EdicionForm[] Ediciones { get; set; }
		public EstadoProductoForm[] EstadosProductos { get; set; }
        public EventoForm[] Eventos { get; set; }
        public RevistaPublicacionForm[] RevistaPublicaciones { get; set; }
		public IdiomaForm[] Idiomas { get; set; }
        public EditorialForm[] Editoriales { get; set; }
		//public FormaParticipacionForm[] FormasParticipaciones { get; set; }
        public ReimpresionForm[] Reimpresiones { get; set; }
        public InvestigadorExternoForm[] CoautoresExternos { get; set; }
        public InvestigadorForm[] CoautoresInternos { get; set; }
		//public IdentificadorLibroForm[] IdentificadoresLibros { get; set; }
		public AreaForm[] Areas { get; set; }
		public DisciplinaForm[] Disciplinas { get; set; }
		public SubdisciplinaForm[] Subdisciplinas { get; set; }
    }
}
