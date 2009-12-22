namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class OrganoInternoForm
    {
		public int Id { get; set; }
		public string FechaInicial { get; set; }
		public string FechaFinal { get; set; }
		public int Periodo { get; set; }
		public bool Activo { get; set; }
		public string Modificacion { get; set; }
        public string DepartamentoNombre { get; set; }
        public string SedeNombre { get; set; }

        public int Usuario { get; set; }
        public string UsuarioNombre { get; set; }
        public string UsuarioApellidoPaterno { get; set; }
        public string UsuarioApellidoMaterno { get; set; }

        public string Nombre
        {
            get
            {
                return string.Format("{0} {1} {2}", UsuarioApellidoPaterno,
                                     UsuarioApellidoMaterno, UsuarioNombre);
            }
        }

        public int ComprobanteOrganoInternoId { get; set; }
        public string ComprobanteOrganoInternoNombre { get; set; }

        public int ConsejoComision { get; set; }
        public int ConsejoComisionId { get; set; }
        public string ConsejoComisionNombre { get; set; }
		
		/* Catalogos */
        public InvestigadorForm[] Investigadores { get; set; }
		public ConsejoComisionForm[] ConsejosComisiones { get; set; }
        public CustomSelectForm[] Periodos { get; set; }
    }
}