namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ArticuloForm
    {
        public int Id { get; set; }
        public string FechaAceptacion { get; set; }
        public string Titulo { get; set; }
        public int Volumen { get; set; }
        public int Numero { get; set; }
        public int PaginaInicial { get; set; }
        public int PaginaFinal { get; set; }
        public string FechaEdicion { get; set; }
        public int PosicionAutor { get; set; }
        public string PalabraClave1 { get; set; }
        public string PalabraClave2 { get; set; }
        public string PalabraClave3 { get; set; }
        public string FechaPublicacion { get; set; }
        public int Puntuacion { get; set; }
        public bool Activo { get; set; }
        public bool TieneProyecto { get; set; }
        public string Modificacion { get; set; }

        public string AnioPublicacion { get; set; }

        public int TipoArticulo { get; set; }
        public int EstadoProducto { get; set; }
        
        public int ProyectoId { get; set; }
        public string ProyectoNombre { get; set; }

        public int SubdisciplinaId { get; set; }
        public string SubdisciplinaNombre { get; set; }

        public int RevistaPublicacionId { get; set; }
        public string RevistaPublicacionTitulo { get; set; }

        public int AreaTematicaId { get; set; }
        public string AreaTematicaNombre { get; set; }
        
        public string DepartamentoNombre { get; set; }
        public string SedeNombre { get; set; }

        public int TotalAutores
        {
            get
            {
                return (CoautorExternoArticulos == null ? 0 : CoautorExternoArticulos.Length) +
                    (CoautorInternoArticulos == null ? 0 : CoautorInternoArticulos.Length) + 1;
            }
        }

        public CoautorExternoProductoForm[] CoautorExternoArticulos { get; set; }
        public CoautorInternoProductoForm[] CoautorInternoArticulos { get; set; }
        public ArchivoForm[] ArchivoArticulos { get; set; }

        /* New */
        public CoautorExternoProductoForm CoautorExternoProducto { get; set; }
        public CoautorInternoProductoForm CoautorInternoProducto { get; set; }
        public ArchivoForm ArchivoArticulo { get; set; }
        public TipoArchivoForm[] TipoArchivos { get; set; }

        /* Show */
        public ShowFieldsForm ShowFields { get; set; }
        public RevistaPublicacionForm RevistaPublicacion { get; set; }
        public ProyectoForm Proyecto { get; set; }
        public AreaTematicaForm AreaTematica { get; set; }
        public SubdisciplinaForm Subdisciplina { get; set; }

        /* Catalogos */
        public CustomSelectForm[] EstadosProductos { get; set; }
        public CustomSelectForm[] TiposArticulos { get; set; }
        public ProyectoForm[] Proyectos { get; set; }
    }
}