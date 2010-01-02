namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ResenaForm
    {
        public int Id { get; set; }
        public string Numero { get; set; }
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
        public string Volumen { get; set; }
        public bool CoautorSeOrdenaAlfabeticamente { get; set; }

        public int ComprobanteAceptadoId { get; set; }
        public string ComprobanteAceptadoNombre { get; set; }

        public int ComprobanteResenaId { get; set; }
        public string ComprobanteResenaNombre { get; set; }

        public int FirmaAceptacion2 { get; set; }
        public string FirmaDescripcion { get; set; }

        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        public int AreaTematicaId { get; set; }
        public string AreaTematicaNombre { get; set; }

        public int AreaId { get; set; }
        public int DisciplinaId { get; set; }
        public int SubdisciplinaId { get; set; }

        public string SubdisciplinaNombre { get; set; }
        public string DisciplinaNombre { get; set; }
        public string AreaNombre { get; set; }

        public int TipoResena { get; set; }
        public int EstadoProducto { get; set; }

        public int RevistaPublicacionId { get; set; }
        public string RevistaPublicacionTitulo { get; set; }

        public int Pais { get; set; }
        public int PaisId { get; set; }
        public string PaisNombre { get; set; }

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

        /* Catalogos */
        public CustomSelectForm[] TiposResenas { get; set; }
        public CustomSelectForm[] EstadosProductos { get; set; }
        public PaisForm[] Paises { get; set; }
        public AreaForm[] Areas { get; set; }
        public DisciplinaForm[] Disciplinas { get; set; }
        public SubdisciplinaForm[] Subdisciplinas { get; set; }
    }
}