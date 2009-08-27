namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class UsuarioForm
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string ApellidoPaterno { get; set; }
        public string ApellidoMaterno { get; set; }
        public string CorreoElectronico { get; set; }
        public string Sexo { get; set; }
        public string FechaNacimiento { get; set; }
        public string FechaIngreso { get; set; }

        public string NombreCompleto {
            get { return string.Format("{0} {1} {2}", ApellidoPaterno, ApellidoMaterno, Nombre); }
        }
    }
}