namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ResenaForm
    {
        public int Id { get; set; }
        public string Volumen { get; set; }
        public int Numero { get; set; }
        public int PosicionAutor { get; set; }
        public bool ResenaTraducida { get; set; }
        public string NombreProducto { get; set; }
        public int PaginaInicial { get; set; }
        public int PaginaFinal { get; set; }
        public string TituloLibro { get; set; }
        public string PalabraClave1 { get; set; }
        public string PalabraClave2 { get; set; }
        public string PalabraClave3 { get; set; }
        public string FechaAceptacion { get; set; }
        public string FechaPublicacion { get; set; }
        public string FechaEdicion { get; set; }
        public string DepartamentoNombre { get; set; }
        public string SedeNombre { get; set; }
        public string AnioPublicacion { get; set; }

        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        public int AreaTematica { get; set; }
        public int AreaTematicaId { get; set; }
        public string AreaTematicaNombre { get; set; }

        public int Idioma { get; set; }
        public int IdiomaId { get; set; }
        public string IdiomaNombre { get; set; }

        public int TipoResena { get; set; }
        public int TipoResenaId { get; set; }
        public string TipoResenaNombre { get; set; }

        public int EstadoProducto { get; set; }
        public int EstadoProductoId { get; set; }
        public string EstadoProductoNombre { get; set; }

        public int Proyecto { get; set; }
        public int ProyectoId { get; set; }
        public string ProyectoNombre { get; set; }

        public int LineaTematicaId { get; set; }
        public string LineaTematicaNombre { get; set; }

        public int InstitucionId { get; set; }
        public string InstitucionNombre { get; set; }

        public int RevistaPublicacionId { get; set; }
        public string RevistaPublicacionTitulo { get; set; }
        public string RevistaPublicacionPaisNombre { get; set; }
        public string RevistaPublicacionInstitucionNombre { get; set; }

        public int Editorial { get; set; }
        public int EditorialId { get; set; }
        public string EditorialNombre { get; set; }

        public int Pais { get; set; }
        public int PaisId { get; set; }
        public string PaisNombre { get; set; }

        public int Area { get; set; }
        public int AreaId { get; set; }
        public string AreaNombre { get; set; }

        public int Disciplina { get; set; }
        public int DisciplinaId { get; set; }
        public string DisciplinaNombre { get; set; }

        public int Subdisciplina { get; set; }
        public int SubdisciplinaId { get; set; }
        public string SubdisciplinaNombre { get; set; }

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
        public AutorResenaForm[] AutorResenas { get; set; }

        public CoautorExternoProductoForm CoautorExternoProducto { get; set; }
        public CoautorInternoProductoForm CoautorInternoProducto { get; set; }
        public AutorResenaForm AutorResena { get; set; }

        /* Catalogos */
        public TipoResenaForm[] TiposResenas { get; set; }
        public EstadoProductoForm[] EstadosProductos { get; set; }
        public InvestigadorExternoForm[] CoautoresExternos { get; set; }
        public InvestigadorForm[] CoautoresInternos { get; set; }
        public EditorialForm[] Editoriales { get; set; }
        public PaisForm[] Paises { get; set; }
        public IdiomaForm[] Idiomas { get; set; }
        public AreaTematicaForm[] AreasTematicas { get; set; }
        public AreaForm[] Areas { get; set; }
        public DisciplinaForm[] Disciplinas { get; set; }
        public SubdisciplinaForm[] Subdisciplinas { get; set; }
    }
}