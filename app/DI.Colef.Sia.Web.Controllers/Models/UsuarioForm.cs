namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class UsuarioForm
    {
        public int Id { get; set; }
        public string PersonaNombre { get; set; }
        public string PersonaApellidoPaterno { get; set; }
        public string PersonaApellidoMaterno { get; set; }

        public string Nombre {
            get { return string.Format("{0} {1} {2}", PersonaApellidoPaterno, PersonaApellidoMaterno, PersonaNombre); }
        }
    }
}