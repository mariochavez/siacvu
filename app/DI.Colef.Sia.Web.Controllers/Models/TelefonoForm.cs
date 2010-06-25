namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class TelefonoForm
    {
        public int Id { get; set; }
        public string Numero { get; set; }
        public int TipoTelefono { get; set; }
        public string Modificacion { get; set; }

        public int UsuarioId { get; set; }
    }
}
