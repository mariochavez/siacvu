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
        public string TipoEstanciaNombre { get; set; }

        public int TipoInstitucion { get; set; }
        public int TipoInstitucionId { get; set; }
        public string TipoInstitucionNombre { get; set; }
        
        public int InstitucionId { get; set; }
        public string InstitucionNombre { get; set; }

        public string LineaTematicaNombre { get; set; }
        public int LineaTematicaId { get; set; }

        public int Convenio { get; set; }
        public int ConvenioId { get; set; }
        public string ConvenioNombre { get; set; }

        /* Catalogos */
        public TipoEstanciaForm[] TiposEstancias { get; set; }
    }
}
