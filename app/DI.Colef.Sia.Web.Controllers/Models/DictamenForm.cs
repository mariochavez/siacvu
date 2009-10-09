namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class DictamenForm
    {
		public int Id { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }
        public string DepartamentoNombre { get; set; }
        public string SedeNombre { get; set; }

		public int TipoDictamen { get; set; }
        public int TipoDictamenId { get; set; }
        public string TipoDictamenNombre { get; set; }

        public int FondoConacyt { get; set; }
        public int FondoConacytId { get; set; }
        public string FondoConacytNombre { get; set; }

        public int Editorial { get; set; }
        public int EditorialId { get; set; }
        public string EditorialNombre { get; set; }
        public string EditorialInstitucionNombre { get; set; }

        public string RevistaPublicacionTitulo { get; set; }
        public int RevistaPublicacionId { get; set; }
        public string RevistaPublicacionInstitucionNombre { get; set; }

        public string PeriodoReferenciaPeriodo { get; set; }

        /* New */
        public RevistaPublicacionForm RevistaPublicacion { get; set; }
        
        /* Catalogos */
        public TipoDictamenForm[] TiposDictamenes { get; set; }
        public FondoConacytForm[] FondosConacyt { get; set; }
        public EditorialForm[] Editoriales { get; set; }
    }
}