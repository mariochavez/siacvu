namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class DictamenForm : BaseForm
    {
        public bool Activo { get; set; }
        public string Modificacion { get; set; }
        public string DepartamentoNombre { get; set; }
        public string SedeNombre { get; set; }
        public string Nombre { get; set; }
        public string FechaDictamen { get; set; }

		public int TipoDictamen { get; set; }
        public int TipoDictamenId { get; set; }
        public string TipoDictamenNombre { get; set; }

        public int FondoConacyt { get; set; }
        public int FondoConacytId { get; set; }
        public string FondoConacytNombre { get; set; }

        public EditorialProductoForm[] EditorialDictamenes { get; set; }

        public override EditorialProductoForm[] Editoriales
        {
            get { return EditorialDictamenes; }
        }

        public ArchivoForm[] ArchivosDictamen { get; set; }

        public override ArchivoForm[] Archivos
        {
            get { return ArchivosDictamen; }
        }

        /* Show */
        public ShowFieldsForm ShowFields { get; set; }
        public RevistaPublicacionForm RevistaPublicacion { get; set; }

        /* Catalogos */
        public TipoDictamenForm[] TiposDictamenes { get; set; }
        public FondoConacytForm[] FondosConacyt { get; set; }
    }
}