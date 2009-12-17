namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ArchivoForm
    {
        public int Id { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        public string Nombre { get; set; }

        public int TipoArchivo { get; set; }
        public int TipoArchivoId { get; set; }
        public string TipoArchivoNombre { get; set; }

        public int ModelId { get; set; }

        public ArchivoForm[] Archivos { get; set; }
        public TipoArchivoForm[] TipoArchivos { get; set; }
    }
}