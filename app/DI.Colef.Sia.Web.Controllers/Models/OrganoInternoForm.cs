namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class OrganoInternoForm : BaseForm
    {
		public string FechaInicial { get; set; }
		public string FechaFinal { get; set; }
		public int Periodo { get; set; }
		public bool Activo { get; set; }
		public string Modificacion { get; set; }
        public string DepartamentoNombre { get; set; }
        public string SedeNombre { get; set; }

        public InvestigadorForm Investigador { get; set; }
        public int InvestigadorId { get; set; }

        public int ConsejoComision { get; set; }
        public int ConsejoComisionId { get; set; }
        public string ConsejoComisionNombre { get; set; }
        public ArchivoForm[] ArchivosOrganoInterno { get; set; }

        public override ArchivoForm[] Archivos
        {
            get { return ArchivosOrganoInterno; }
        }

		/* Catalogos */
        public InvestigadorForm[] Investigadores { get; set; }
		public ConsejoComisionForm[] ConsejosComisiones { get; set; }
        public CustomSelectForm[] Periodos { get; set; }
    }
}