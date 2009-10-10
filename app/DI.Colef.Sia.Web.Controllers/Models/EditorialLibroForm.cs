namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class EditorialLibroForm
    {
        public int Id { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        //Espacio para Agregar Mapeos
        public int Editorial { get; set; }
        public int EditorialId { get; set; }
        public string EditorialNombre { get; set; }
        public string EditorialInstitucionNombre { get; set; }
        public string EditorialPaisNombre { get; set; }

        public int ParentId { get; set; }
    }
}
