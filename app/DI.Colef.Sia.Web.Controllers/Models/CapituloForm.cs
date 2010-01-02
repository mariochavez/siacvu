namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class CapituloForm
    {
		public int Id { get; set; }
		public string NombreCapitulo { get; set; }
		public string FechaAceptacion { get; set; }
		public string NombreLibro { get; set; }
        public int PaginaInicial { get; set; }
        public int PaginaFinal { get; set; }
        public int NoCitas { get; set; }
		public string AutorLibro { get; set; }
        public string FechaPublicacion { get; set; }
		public string Resumen { get; set; }
		public bool Activo { get; set; }
		public string Modificacion { get; set; }
        public int PosicionCoautor { get; set; }
        public bool TieneProyecto { get; set; }
        public string DepartamentoNombre { get; set; }
        public string SedeNombre { get; set; }
        public string Volumen { get; set; }
        public bool CoautorSeOrdenaAlfabeticamente { get; set; }

        public int ComprobanteAceptadoId { get; set; }
        public string ComprobanteAceptadoNombre { get; set; }

        public int ComprobanteCapituloId { get; set; }
        public string ComprobanteCapituloNombre { get; set; }

        public int FirmaAceptacion2 { get; set; }
        public string FirmaDescripcion { get; set; }

        public int TipoCapitulo { get; set; }
        public int TipoLibro { get; set; }
        public int EstadoProducto { get; set; }

        public int ProyectoId { get; set; }
        public string ProyectoNombre { get; set; }

        public int AreaId { get; set; }
        public int DisciplinaId { get; set; }
        public int SubdisciplinaId { get; set; }

        public string SubdisciplinaNombre { get; set; }
        public string DisciplinaNombre { get; set; }
        public string AreaNombre { get; set; }

        public int AreaTematicaId { get; set; }
        public string AreaTematicaNombre { get; set; }

        public string UsuarioNombre { get; set; }
        public string UsuarioApellidoPaterno { get; set; }
        public string UsuarioApellidoMaterno { get; set; }

        public string InvestigadorNombre1 { get; private set; }
        public string InvestigadorNombre
        {
            get { return string.Format("{0} {1} {2}", UsuarioApellidoPaterno, UsuarioApellidoMaterno, UsuarioNombre); }
            set { InvestigadorNombre1 = value; }
        }

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