namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class UsuarioForm
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string ApellidoPaterno { get; set; }
        public string ApellidoMaterno { get; set; }
        public string Direccion { get; set; }
        //public string Telefono { get; set; }
        public string CorreoElectronico { get; set; }
        public string EstadoCivil { get; set; }
        public string Sexo { get; set; }
        public string FechaNacimiento { get; set; }
        public string FechaIngreso { get; set; }
        public string DocumentosIdentidad { get; set; }
        public string CURP { get; set; }
        public string RFC { get; set; }
        public string CedulaProfesional { get; set; }
        public string Nacionalidad { get; set; }
        public string CodigoRH { get; set; }
        public string UsuarioNombre { get; set; }
        public bool Activo { get; set; }
        public bool Investigador { get; set; }

        public string NombreCompleto {
            get { return string.Format("{0} {1} {2}", ApellidoPaterno, ApellidoMaterno, Nombre); }
        }

        public RolForm[] Roles { get; set; }

        public RolForm Rol { get; set; }

        public RolForm[] RolesUsuario { get; set; }

        public TelefonoForm[] Telefonos { get; set; }

        public TelefonoForm Telefono { get; set; }
    }
}