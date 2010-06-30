namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class CorreoElectronicoForm
    {
        public int Id { get; set; }
        public string Direccion { get; set; }
        public int TipoCorreo { get; set; }
        public string Modificacion { get; set; }

        public int UsuarioId { get; set; }
    }
}
