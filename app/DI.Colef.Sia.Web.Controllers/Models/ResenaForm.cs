namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ResenaForm
    {
        public int Id { get; set; }
        public int Numero { get; set; }
        public int PosicionAutor { get; set; }
        public string NombreProducto { get; set; }
        public int PaginaInicial { get; set; }
        public int PaginaFinal { get; set; }
        public string TituloLibro { get; set; }
        public string PalabraClave1 { get; set; }
        public string PalabraClave2 { get; set; }
        public string PalabraClave3 { get; set; }
        public string FechaAceptacion { get; set; }
        public string FechaPublicacion { get; set; }
        public string DepartamentoNombre { get; set; }
        public string SedeNombre { get; set; }
        public int Volumen { get; set; }

        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        public int AreaTematicaId { get; set; }
        public string AreaTematicaNombre { get; set; }

        public int SubdisciplinaId { get; set; }
        public string SubdisciplinaNombre { get; set; }

        public int TipoResena { get; set; }
        public int EstadoProducto { get; set; }

        public int RevistaPublicacionId { get; set; }
        public string RevistaPublicacionTitulo { get; set; }

        public int Pais { get; set; }
        public int PaisId { get; set; }
        public string PaisNombre { get; set; }

        public int TotalAutores
        {
            get
            {
                return (CoautorExternoResenas == null ? 0 : CoautorExternoResenas.Length) +
                    (CoautorInternoResenas == null ? 0 : CoautorInternoResenas.Length) + 1;
            }
        }

        /* New */
        public CoautorExternoProductoForm[] CoautorExternoResenas { get; set; }
        public CoautorInternoProductoForm[] CoautorInternoResenas { get; set; }
        public AutorInternoProductoForm[] AutorInternoResenas { get; set; }
        public AutorExternoProductoForm[] AutorExternoResenas { get; set; }
        public EditorialProductoForm[] EditorialResenas { get; set; }

        public CoautorExternoProductoForm CoautorExternoProducto { get; set; }
        public CoautorInternoProductoForm CoautorInternoProducto { get; set; }
        public AutorInternoProductoForm[] AutorInternoResena { get; set; }
        public AutorExternoProductoForm[] AutorExternoResena { get; set; }
        public EditorialProductoForm[] EditorialResena { get; set; }

        /* Show */
        public ShowFieldsForm ShowFields { get; set; }
        public RevistaPublicacionForm RevistaPublicacion { get; set; }
        public AreaTematicaForm AreaTematica { get; set; }
        public SubdisciplinaForm Subdisciplina { get; set; }

        /* Catalogos */
        public CustomSelectForm[] TiposResenas { get; set; }
        public CustomSelectForm[] EstadosProductos { get; set; }
        public PaisForm[] Paises { get; set; }
        public AreaForm[] Areas { get; set; }
        public DisciplinaForm[] Disciplinas { get; set; }
        public SubdisciplinaForm[] Subdisciplinas { get; set; }
    }
}