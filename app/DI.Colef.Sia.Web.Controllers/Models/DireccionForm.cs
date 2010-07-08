namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class DireccionForm
    {
        public int Id { get; set; }
        public string LineaDireccion { get; set; }
        public string Ciudad { get; set;}
        public string Modificacion { get; set; }

        public int UsuarioId { get; set; }

        public int Pais { get; set; }
        public int PaisId { get; set; }
        public string PaisNombre { get; set; }

        public int EstadoPais { get; set; }
        public int EstadoPaisId { get; set; }
        public string EstadoPaisNombre { get; set; }

        /* Catalogos */
        public PaisForm[] Paises { get; set; }
        public EstadoPaisForm[] EstadosPaises { get; set; }
    }
}
