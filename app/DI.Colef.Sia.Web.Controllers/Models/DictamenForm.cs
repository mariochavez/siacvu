namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class DictamenForm
    {
		public int Id { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }
        public string DepartamentoNombre { get; set; }
        public string SedeNombre { get; set; }
        public string Nombre { get; set; }
        public string FechaDictamen { get; set; }

		public int TipoDictamen { get; set; }
        public int TipoDictamenId { get; set; }
        public string TipoDictamenNombre { get; set; }

        public int ComprobanteDictamenId { get; set; }
        public string ComprobanteDictamenNombre { get; set; }

        public int FirmaAceptacion2 { get; set; }
        public string FirmaDescripcion { get; set; }

        public int FondoConacyt { get; set; }
        public int FondoConacytId { get; set; }
        public string FondoConacytNombre { get; set; }

        public int RevistaPublicacionId { get; set; }
        public string RevistaPublicacionTitulo { get; set; }

        /* Show */
        public ShowFieldsForm ShowFields { get; set; }
        public RevistaPublicacionForm RevistaPublicacion { get; set; }

        public EditorialProductoForm[] EditorialDictamenes { get; set; }

        /* New */
        public EditorialProductoForm EditorialProducto { get; set; }
        
        /* Catalogos */
        public TipoDictamenForm[] TiposDictamenes { get; set; }
        public FondoConacytForm[] FondosConacyt { get; set; }
    }
}