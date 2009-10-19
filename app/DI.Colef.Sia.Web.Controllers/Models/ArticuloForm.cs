namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ArticuloForm
    {
        public int Id { get; set; }
        public string FechaAceptacion { get; set; }
        public string Titulo { get; set; }
        public string Volumen { get; set; }
        public int Numero { get; set; }
        public int PaginaInicial { get; set; }
        public int PaginaFinal { get; set; }
        public string FechaEdicion { get; set; }
        public int Participantes { get; set; }
        public int PosicionAutor { get; set; }
        public string PalabraClave1 { get; set; }
        public string PalabraClave2 { get; set; }
        public string PalabraClave3 { get; set; }
        public string FechaPublicacion { get; set; }
        public int Puntuacion { get; set; }
        public bool Activo { get; set; }
        public bool TieneProyecto { get; set; }
        public bool ArticuloTraducido { get; set; }
        public string Modificacion { get; set; }

        public string AnioPublicacion { get; set; }

        public int TipoArticulo { get; set; }
        public int TipoArticuloId { get; set; }
        public string TipoArticuloNombre { get; set; }

        public int Idioma { get; set; }
        public int IdiomaId { get; set; }
        public string IdiomaNombre { get; set; }

        public int EstadoProducto { get; set; }
        public int EstadoProductoId { get; set; }
        public string EstadoProductoNombre { get; set; }
        
        public int ProyectoId { get; set; }
        public string ProyectoNombre { get; set; }
        public string ProyectoLineaTematicaNombre { get; set; }
        public string ProyectoAreaTematicaNombre { get; set; }

        public string RevistaPublicacionTitulo { get; set; }
        public int RevistaPublicacionId { get; set; }
        public string RevistaPublicacionIndice1Nombre { get; set; }
        public string RevistaPublicacionIndice2Nombre { get; set; }
        public string RevistaPublicacionIndice3Nombre { get; set; }
        public string RevistaPublicacionInstitucionNombre { get; set; }
        public string RevistaPublicacionPaisNombre { get; set; }

        public int LineaInvestigacion { get; set; }
        public int LineaInvestigacionId { get; set; }
        public string LineaInvestigacionNombre { get; set; }

        public int TipoActividad { get; set; }
        public int TipoActividadId { get; set; }
        public string TipoActividadNombre { get; set; }

        public int TipoParticipante { get; set; }
        public int TipoParticipanteId { get; set; }
        public string TipoParticipanteNombre { get; set; }

        public int Area { get; set; }
        public int AreaId { get; set; }
        public string AreaNombre { get; set; }

        public int Disciplina { get; set; }
        public int DisciplinaId { get; set; }
        public string DisciplinaNombre { get; set; }

        public int Subdisciplina { get; set; }
        public int SubdisciplinaId { get; set; }
        public string SubdisciplinaNombre { get; set; }
        
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
        public RevistaPublicacionForm RevistaPublicacion { get; set; }
        public ArchivoForm ArchivoArticulo { get; set; }

        public TipoArchivoForm[] TipoArchivos { get; set; }

        /* Catalogos */
        public TipoArticuloForm[] TiposArticulos { get; set; }
        public IdiomaForm[] Idiomas { get; set; }
        public EstadoProductoForm[] EstadosProductos { get; set; }
        //public InvestigadorExternoForm[] CoautoresExternos { get; set; }
        //public InvestigadorForm[] CoautoresInternos { get; set; }
        public LineaInvestigacionForm[] LineasInvestigaciones { get; set; }
        public TipoActividadForm[] TiposActividades { get; set; }
        public TipoParticipacionForm[] TiposParticipantes { get; set; }
        public AreaForm[] Areas { get; set; }
        public DisciplinaForm[] Disciplinas { get; set; }
        public SubdisciplinaForm[] Subdisciplinas { get; set; }
        public ProyectoForm[] Proyectos { get; set; }
    }
}
