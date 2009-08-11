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
        public string Tiraje { get; set; }
        public string PalabrasClave { get; set; }
        public string CoTraductor { get; set; }
        public string Traductor { get; set; }
        public string Modificacion { get; set; }

        public int NoPaginas { get; set; }

        public bool Activo { get; set; }
        public bool TieneProyecto { get; set; }

		public int TipoPublicacion { get; set; }
		public int TipoPublicacionId { get; set; }

		public int EstadoProducto { get; set; }
		public int EstadoProductoId { get; set; }

		public int PeriodoReferencia { get; set; }
		public int PeriodoReferenciaId { get; set; }

		public int Proyecto { get; set; }
		public int ProyectoId { get; set; }

		public int LineaTematica { get; set; }
		public int LineaTematicaId { get; set; }

		public int Pais { get; set; }
		public int PaisId { get; set; }

		
		public int Idioma { get; set; }
		public int IdiomaId { get; set; }

		public int FormaParticipacion { get; set; }
		public int FormaParticipacionId { get; set; }

		public int IdentificadorLibro { get; set; }
		public int IdentificadorLibroId { get; set; }

		public int Area { get; set; }
		public int AreaId { get; set; }

		public int Disciplina { get; set; }
		public int DisciplinaId { get; set; }

		public int Subdisciplina { get; set; }
		public int SubdisciplinaId { get; set; }

        public int Investigador { get; set; }
		
		public CoautorExternoLibroForm[] CoautorExternoLibros { get; set; }
		public CoautorInternoLibroForm[] CoautorInternoLibros { get; set; }

        /* New */
        public CoautorExternoLibroForm CoautorExternoLibro { get; set; }
        public CoautorInternoLibroForm CoautorInternoLibro { get; set; }
		
		/* Catalogos */
		public TipoPublicacionForm[] TiposPublicaciones { get; set; }
		public EstadoProductoForm[] EstadosProductos { get; set; }
		public PeriodoReferenciaForm[] PeriodosReferencias { get; set; }
		public ProyectoForm[] Proyectos { get; set; }
		public LineaTematicaForm[] LineasTematicas { get; set; }
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
