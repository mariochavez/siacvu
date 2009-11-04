namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class DireccionRegionalForm
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        public int Sede { get; set; }
        public int SedeId { get; set; }

        public SedeForm[] Sedes { get; set; }
    }
}
