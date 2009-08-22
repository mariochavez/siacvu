namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class DictamenForm
    {
		public int Id { get; set; }
		public string Nombre { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

		public int TipoDictamen { get; set; }
        public int TipoDictamenId { get; set; }

		public int TipoParticipacion { get; set; }
        public int TipoParticipacionId { get; set; }

		public int Institucion { get; set; }
        public int InstitucionId { get; set; }

        public int Investigador { get; set; }

        public string PeriodoReferenciaPeriodo { get; set; }
				
		/* Catalogos */
        public TipoDictamenForm[] TiposDictamenes { get; set; }
		public TipoParticipacionForm[] TiposParticipaciones { get; set; }
		public InstitucionForm[] Instituciones { get; set; }
    }
}