namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class GlosarioForm
    {
        public int Id { get; set; }
        public string Campo { get; set; }
        public string Descripcion { get; set; }
        public string Contexto { get; set; }

        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        public int ModelId { get; set; }
        public int GlosarioId { get; set; }
        public string GlosarioCampo { get; set; }

        /*Fields for has many*/
        public string Controller { get; set; }
        public string IdName { get; set; }
    }
}
