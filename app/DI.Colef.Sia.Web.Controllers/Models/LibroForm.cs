namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class LibroForm
    {
		public int Id { get; set; }
        public string Nombre { get; set; }
        public string ISBN { get; set; }
        public string FechaAceptacion { get; set; }
        public string FechaPublicacion { get; set; }
        public string Volumen { get; set; }
        public int ContenidoLibro { get; set; }
        public int FormatoPublicacion { get; set; }
        public string PalabraClave1 { get; set; }
        public string PalabraClave2 { get; set; }
        public string PalabraClave3 { get; set; }
        public string Modificacion { get; set; }
        public string DepartamentoNombre { get; set; }
        public string SedeNombre { get; set; }
        public int PosicionAutor { get; set; }

        public int ComprobanteAceptadoId { get; set; }
        public string ComprobanteAceptadoNombre { get; set; }

        public int ComprobantePublicadoId { get; set; }
        public string ComprobantePublicadoNombre { get; set; }

        public int ComprobanteCapituloId { get; set; }
        public string ComprobanteCapituloNombre { get; set; }

        public int NoPaginas { get; set; }
        public string Numero { get; set; }
        public int Tiraje { get; set; }

        public bool Activo { get; set; }
        public bool TieneProyecto { get; set; }

        public int TipoProducto { get; set; }

        public int Edicion { get; set; }

        public int EventoId { get; set; }
        public string EventoNombre { get; set; }
        public string EventoFechaEvento { get; set; }

        public int RevistaPublicacionId { get; set; }
        public string RevistaPublicacionTitulo { get; set; }

        public int AreaTematicaId { get; set; }
        public string AreaTematicaNombre { get; set; }

        public int EstadoProducto { get; set; }

        public int AreaId { get; set; }
        public int DisciplinaId { get; set; }
        public int SubdisciplinaId { get; set; }

        public string SubdisciplinaNombre { get; set; }
        public string DisciplinaNombre { get; set; }
        public string AreaNombre { get; set; }

		public int ProyectoId { get; set; }
        public string ProyectoNombre { get; set; }

        public int Reimpresion { get; set; }

        public EventoForm Evento { get; set; }

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
        public EditorialProductoForm[] EditorialLibros { get; set; }

        /* New */
        public CoautorExternoProductoForm CoautorExternoProducto { get; set; }
        public CoautorInternoProductoForm CoautorInternoProducto { get; set; }
        public EditorialProductoForm EditorialProducto { get; set; }

        /* Show */
        public ShowFieldsForm ShowFields { get; set; }
        public AreaTematicaForm AreaTematica { get; set; }
        public RevistaPublicacionForm RevistaPublicacion { get; set; }
        public ProyectoForm Proyecto { get; set; }
		
		/* Catalogos */
        public CustomSelectForm[] TiposProductos { get; set; }
        public CustomSelectForm[] FormatosPublicaciones { get; set; }
        public CustomSelectForm[] ContenidosLibros { get; set; }
        public CustomSelectForm[] Ediciones { get; set; }
        public CustomSelectForm[] EstadosProductos { get; set; }
        public CustomSelectForm[] Reimpresiones { get; set; }
        public AreaForm[] Areas { get; set; }
        public DisciplinaForm[] Disciplinas { get; set; }
        public SubdisciplinaForm[] Subdisciplinas { get; set; }
    }
}