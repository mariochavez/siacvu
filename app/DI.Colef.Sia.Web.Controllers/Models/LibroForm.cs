namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class LibroForm
    {
		public int Id { get; set; }
        public string Nombre { get; set; }
        public string ISBN { get; set; }
        public string Editorial { get; set; }
        public string FechaAceptacion { get; set; }
        public string FechaEdicion { get; set; }
        public string Volumen { get; set; }
        public string FechaEvento { get; set; }
        public string PalabraClave1 { get; set; }
        public string PalabraClave2 { get; set; }
        public string PalabraClave3 { get; set; }
        public bool Traductor { get; set; }
        public string NombreTraductor { get; set; }
        public string Modificacion { get; set; }
        public string DepartamentoNombre { get; set; }
        public string SedeNombre { get; set; }

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

        public string NombreEvento { get; set; }
        public int NombreEventoId { get; set; }

        public string NombreRevistaTitulo { get; set; }
        public int NombreRevistaId { get; set; }

        public string InstitucionNombre { get; set; }
        public int InstitucionId { get; set; }

		public int EstadoProducto { get; set; }
		public int EstadoProductoId { get; set; }
        public string EstadoProductoNombre { get; set; }

		public int Proyecto { get; set; }
		public int ProyectoId { get; set; }
        public string ProyectoNombre { get; set; }

		public int LineaTematicaId { get; set; }
        public string LineaTematicaNombre { get; set; }

		public int Pais { get; set; }
		public int PaisId { get; set; }
        public string PaisNombre { get; set; }
		
		public int Idioma { get; set; }
		public int IdiomaId { get; set; }
        public string IdiomaNombre { get; set; }

		public int FormaParticipacion { get; set; }
		public int FormaParticipacionId { get; set; }
        public string FormaParticipacionNombre { get; set; }

		public int IdentificadorLibro { get; set; }
		public int IdentificadorLibroId { get; set; }
        public string IdentificadorLibroNombre { get; set; }

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

        /* New */
        public CoautorExternoProductoForm CoautorExternoProducto { get; set; }
        public CoautorInternoProductoForm CoautorInternoProducto { get; set; }
		
		/* Catalogos */
        public TipoPublicacionForm[] TiposPublicaciones { get; set; }
        public TipoProductoForm[] TiposProductos { get; set; }
        public FormatoPublicacionForm[] FormatosPublicaciones { get; set; }
        public EdicionForm[] Ediciones { get; set; }
		public EstadoProductoForm[] EstadosProductos { get; set; }
        public ProyectoForm[] Proyectos { get; set; }
        public EventoForm[] Eventos { get; set; }
        public RevistaPublicacionForm[] RevistaPublicaciones { get; set; }
        public InstitucionForm[] Instituciones { get; set; }
		public PaisForm[] Paises { get; set; }
		public IdiomaForm[] Idiomas { get; set; }
		public FormaParticipacionForm[] FormasParticipaciones { get; set; }
        public InvestigadorExternoForm[] CoautoresExternos { get; set; }
        public InvestigadorForm[] CoautoresInternos { get; set; }
		public IdentificadorLibroForm[] IdentificadoresLibros { get; set; }
		public AreaForm[] Areas { get; set; }
		public DisciplinaForm[] Disciplinas { get; set; }
		public SubdisciplinaForm[] Subdisciplinas { get; set; }
    }
}
