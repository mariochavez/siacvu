namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class CapituloForm
    {
		public int Id { get; set; }
		public string NombreCapitulo { get; set; }
		public string FechaAceptacion { get; set; }
		public string NombreLibro { get; set; }
		public int NoPaginas { get; set; }
        public int NoCitas { get; set; }
		public string AutorLibro { get; set; }
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
        public int TipoLibro { get; set; }
        public int EstadoProducto { get; set; }

        public int ProyectoId { get; set; }
        public string ProyectoNombre { get; set; }

        public int SubdisciplinaId { get; set; }
        public string SubdisciplinaNombre { get; set; }

        public int AreaTematicaId { get; set; }
        public string AreaTematicaNombre { get; set; }

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
                return (AutorExternoCapitulos == null ? 0 : AutorExternoCapitulos.Length) +
                       (AutorInternoCapitulos == null ? 0 : AutorInternoCapitulos.Length);
            }
        }

        public CoautorExternoProductoForm[] CoautorExternoCapitulos { get; set; }
        public CoautorInternoProductoForm[] CoautorInternoCapitulos { get; set; }
        public AutorInternoProductoForm[] AutorInternoCapitulos { get; set; }
        public AutorExternoProductoForm[] AutorExternoCapitulos { get; set; }
        public EditorialProductoForm[] EditorialCapitulos { get; set; }
		
		/* New */
		public CoautorExternoProductoForm CoautorExternoProducto { get; set; }
        public CoautorInternoProductoForm CoautorInternoProducto { get; set; }
        public AutorInternoProductoForm AutorInternoProducto { get; set; }
        public AutorExternoProductoForm AutorExternoProducto { get; set; }
        public EditorialProductoForm EditorialProducto { get; set; }

        /* Show */
        public ShowFieldsForm ShowFields { get; set; }
        public AreaTematicaForm AreaTematica { get; set; }
        public SubdisciplinaForm Subdisciplina { get; set; }
        public ProyectoForm Proyecto { get; set; }

		/* Catalogos */
        public CustomSelectForm[] TiposCapitulos { get; set; }
        public CustomSelectForm[] EstadosProductos { get; set; }
        public ProyectoForm[] Proyectos { get; set; }
        public CustomSelectForm[] TiposLibro { get; set; }

        public AreaForm[] Areas { get; set; }
        public DisciplinaForm[] Disciplinas { get; set; }
        public SubdisciplinaForm[] Subdisciplinas { get; set; }
    }
}