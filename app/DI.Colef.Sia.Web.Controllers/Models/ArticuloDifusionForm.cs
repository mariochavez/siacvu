namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ArticuloDifusionForm
    {
        public int Id { get; set; }
        public string FechaAceptacion { get; set; }
        public string Titulo { get; set; }
        public string Volumen { get; set; }
        public string Numero { get; set; }
        public int PaginaInicial { get; set; }
        public int PaginaFinal { get; set; }
        public int PosicionCoautor { get; set; }
        public string PalabraClave1 { get; set; }
        public string PalabraClave2 { get; set; }
        public string PalabraClave3 { get; set; }
        public string FechaPublicacion { get; set; }
        public int Puntuacion { get; set; }
        public bool Activo { get; set; }
        public bool TieneProyecto { get; set; }
        public string Modificacion { get; set; }
        public bool CoautorSeOrdenaAlfabeticamente { get; set; }

        public int ComprobanteAceptadoId { get; set; }
        public string ComprobanteAceptadoNombre { get; set; }
        public string ComprobanteArticuloNombre { get; set; }
        public int ComprobanteArticuloId { get; set; }

        public int FirmaAceptacion2 { get; set; }
        public string FirmaDescripcion { get; set; }

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

        public int RevistaPublicacionId { get; set; }
        public string RevistaPublicacionTitulo { get; set; }

        public int AreaTematicaId { get; set; }
        public string AreaTematicaNombre { get; set; }

        public string DepartamentoNombre { get; set; }
        public string SedeNombre { get; set; }

        public string UsuarioNombre { get; set; }
        public string UsuarioApellidoPaterno { get; set; }
        public string UsuarioApellidoMaterno { get; set; }

        public string InvestigadorNombre1 { get; private set; }
        public string InvestigadorNombre
        {
            get { return string.Format("{0} {1} {2}", UsuarioApellidoPaterno, UsuarioApellidoMaterno, UsuarioNombre); }
            set { InvestigadorNombre1 = value; }
        }

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
        public ArchivoForm[] ArchivoArticulos { get; set; }

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
        public AreaForm[] Areas { get; set; }
        public DisciplinaForm[] Disciplinas { get; set; }
        public SubdisciplinaForm[] Subdisciplinas { get; set; }
    }
}