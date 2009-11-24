namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class EstanciaAcademicaExternaForm
    {
		public int Id { get; set; }
		public string LineasInvestigacion { get; set; }
        public string Actividades { get; set; }
        public string Logros { get; set; }
        public string FechaInicial { get; set; }
		public string FechaFinal { get; set; }
		public bool Activo { get; set; }
		public string Modificacion { get; set; }

        //Espacio para Agregar Mapeos
        public int TipoEstancia { get; set; }
        public int TipoEstanciaId { get; set; }
        public string TipoEstanciaNombre { get; set; }

        public int GradoAcademico { get; set; }
        public int GradoAcademicoId { get; set; }
        public string GradoAcademicoNombre { get; set; }

        public int InstitucionId { get; set; }
        public string InstitucionNombre { get; set; }

        /* Catalogos */
        public GradoAcademicoForm[] GradosAcademicos { get; set; }
        public TipoEstanciaForm[] TiposEstancias { get; set; }

        /* Show */
        public ShowFieldsForm ShowFields { get; set; }
        public InstitucionForm Institucion { get; set; }
    }
}