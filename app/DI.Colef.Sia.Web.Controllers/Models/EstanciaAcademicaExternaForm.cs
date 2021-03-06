namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class EstanciaAcademicaExternaForm : BaseForm
    {
		public string LineasInvestigacion { get; set; }
        public string Actividades { get; set; }
        public string Logros { get; set; }
        public string FechaInicial { get; set; }
		public string FechaFinal { get; set; }
		public bool Activo { get; set; }
		public string Modificacion { get; set; }

        public string InvestigadorExterno { get; set; }

        //Espacio para Agregar Mapeos
        public int TipoEstancia { get; set; }
        public int TipoEstanciaId { get; set; }
        public string TipoEstanciaNombre { get; set; }

        public int GradoAcademico { get; set; }
        public int GradoAcademicoId { get; set; }
        public string GradoAcademicoNombre { get; set; }

        public string DepartamentoNombre { get; set; }
        public int Departamento { get; set; }
        public int DepartamentoId { get; set; }

        public string SedeDireccionRegionalNombre { get; set; }

        public string SedeNombre { get; set; }
        public int SedeId { get; set; }
        public int Sede { get; set; }
        public ArchivoForm[] ArchivosEstanciaAcademicaExterna { get; set; }

        public override ArchivoForm[] Archivos
        {
            get { return ArchivosEstanciaAcademicaExterna; }
        }
        /* Catalogos */
        public GradoAcademicoForm[] GradosAcademicos { get; set; }
        public TipoEstanciaForm[] TiposEstancias { get; set; }
        public DepartamentoForm[] Departamentos { get; set; }
        public SedeForm[] Sedes { get; set; }

        /* Show */
        public ShowFieldsForm ShowFields { get; set; }
        public InstitucionForm Institucion { get; set; }
    }
}