using System;

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

        //public int Idioma { get; set; }
        //public int IdiomaId { get; set; }
        //public string IdiomaNombre { get; set; }

        public int ProyectoId { get; set; }
        public string ProyectoNombre { get; set; }

        public int SubdisciplinaId { get; set; }
        public string SubdisciplinaNombre { get; set; }

        public int AreaTematicaId { get; set; }
        public string AreaTematicaNombre { get; set; }

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
        public AreaTematicaForm AreaTematica { get; set; }
        public SubdisciplinaForm Subdisciplina { get; set; }
        public ProyectoForm Proyecto { get; set; }

		/* Catalogos */
        public EditorialForm[] Editoriales { get; set; }
        public CustomSelectForm[] TiposCapitulos { get; set; }
        public CustomSelectForm[] EstadosProductos { get; set; }
        //public IdiomaForm[] Idiomas { get; set; }
        public ProyectoForm[] Proyectos { get; set; }
        public CustomSelectForm[] TiposLibro { get; set; }
    }
}