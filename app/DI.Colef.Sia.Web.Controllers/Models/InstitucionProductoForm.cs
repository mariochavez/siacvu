namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class InstitucionProductoForm
    {
        public int Id { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        public int InstitucionId { get; set; }
        public string InstitucionNombre { get; set; }

        public int ParentId { get; set; }

        public bool InstitucionExists
        {
            get
            {
                return InstitucionId > 0;
            }
        }
    }
}