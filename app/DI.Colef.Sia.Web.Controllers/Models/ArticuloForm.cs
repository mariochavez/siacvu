namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ArticuloForm : BaseForm
    {
        public string FechaAceptacion { get; set; }
        public string Titulo { get; set; }
        public string Volumen { get; set; }
        public string Numero { get; set; }
        public int PaginaInicial { get; set; }
        public int PaginaFinal { get; set; }
        public string PalabraClave1 { get; set; }
        public string PalabraClave2 { get; set; }
        public string PalabraClave3 { get; set; }
        public string FechaPublicacion { get; set; }
        public bool Activo { get; set; }
        public bool TieneProyecto { get; set; }
        public string Modificacion { get; set; }
        public bool CoautorSeOrdenaAlfabeticamente { get; set; }

        public int TipoArticulo { get; set; }
        public int EstadoProducto { get; set; }
        
        public int ProyectoId { get; set; }
        public string ProyectoNombre { get; set; }

        public int AreaId { get; set; }
        public int DisciplinaId { get; set; }
        public int SubdisciplinaId { get; set; }

        public string SubdisciplinaNombre { get; set; }
        public string DisciplinaNombre { get; set; }
        public string AreaNombre { get; set; }
        
        public string DepartamentoNombre { get; set; }
        public string SedeNombre { get; set; }

        public int TotalCoautores
        {
            get
            {
                return (CoautorExternoArticulos == null ? 0 : CoautorExternoArticulos.Length) +
                    (CoautorInternoArticulos == null ? 0 : CoautorInternoArticulos.Length) + 1;
            }
        }

        public CoautorExternoProductoForm[] CoautorExternoArticulos { get; set; }
        public CoautorInternoProductoForm[] CoautorInternoArticulos { get; set; }
        public ArchivoForm[] ArchivosArticulo { get; set; }

        public override ArchivoForm[] Archivos
        {
            get { return ArchivosArticulo; }
        }

        /* New */
        public CoautorExternoProductoForm CoautorExternoProducto { get; set; }
        public CoautorInternoProductoForm CoautorInternoProducto { get; set; }
        public ArchivoForm ArchivoArticulo { get; set; }
        public TipoArchivoForm[] TipoArchivos { get; set; }

        /* Show */
        public ShowFieldsForm ShowFields { get; set; }
        public RevistaPublicacionForm RevistaPublicacion { get; set; }
        public AreaTematicaForm AreaTematica { get; set; }
        public ProyectoForm Proyecto { get; set; }

        /* Catalogos */
        public CustomSelectForm[] EstadosProductos { get; set; }
        public CustomSelectForm[] TiposArticulos { get; set; }
        public AreaForm[] Areas { get; set; }
        public DisciplinaForm[] Disciplinas { get; set; }
        public SubdisciplinaForm[] Subdisciplinas { get; set; }
    }
}