namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class MovilidadAcademicaForm
    {
        public int Id { get; set; }
        public string FechaInicial { get; set; }
        public string FechaFinal { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        //Espacio para Agregar Mapeos
        public int TipoEstancia { get; set; }
        public int TipoEstanciaId { get; set; }

        public int TipoInstitucion { get; set; }
        public int TipoInstitucionId { get; set; }
        
        public int InstitucionId { get; set; }
        public string InstitucionNombre { get; set; }

        public string LineaTematicaNombre { get; set; }
        public int LineaTematicaId { get; set; }

        public int Convenio { get; set; }
        public int ConvenioId { get; set; }

        /* New */
        public TipoActividadMovilidadAcademicaForm[] TipoActividadMovilidadAcademicas { get; set; }
        public ProductoDerivadoMovilidadAcademicaForm[] ProductoDerivadoMovilidadAcademicas { get; set; }
        public ProductoAcademicoMovilidadAcademicaForm[] ProductoAcademicoMovilidadAcademicas { get; set; }
        public ProyectoMovilidadAcademicaForm[] ProyectoMovilidadAcademicas { get; set; }

        public TipoActividadMovilidadAcademicaForm TipoActividadMovilidadAcademica { get; set; }
        public ProductoDerivadoMovilidadAcademicaForm ProductoDerivadoMovilidadAcademica { get; set; }
        public ProductoAcademicoMovilidadAcademicaForm ProductoAcademicoMovilidadAcademica { get; set; }
        public ProyectoMovilidadAcademicaForm ProyectoMovilidadAcademica { get; set; }

        /* Catalogos */
        public TipoEstanciaForm[] TiposEstancias { get; set; }
        public TipoInstitucionForm[] TiposInstituciones { get; set; }
        public ConvenioForm[] Convenios { get; set; }
        public TipoActividadForm[] TiposActividades { get; set; }
        public ProductoDerivadoForm[] ProductosDerivados { get; set; }
        public ProductoAcademicoForm[] ProductosAcademicos { get; set; }
        public ProyectoForm[] Proyectos { get; set; }
    }
}
