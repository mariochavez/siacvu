namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class EditorialProductoForm
    {
        public int Id { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        public int EditorialId { get; set; }
        public string EditorialNombre { get; set; }

        public int PaisId { get; set; }
        public int ParentId { get; set; }
    }
}