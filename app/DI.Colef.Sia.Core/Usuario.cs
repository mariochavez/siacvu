using System;
using System.Collections.Generic;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class Usuario : Entity
    {
        public Usuario()
        {
            Roles = new List<Rol>();    
        }

        public virtual string Nombre { get; set; }

        public virtual string ApellidoPaterno { get; set; }

        public virtual string ApellidoMaterno { get; set; }

        public virtual string UsuarioNombre { get; set; }

        public virtual string Clave { get; set; }

        public virtual string CorreoElectronico { get; set; }

        public virtual string Sexo { get; set; }

        public virtual DateTime FechaNacimiento { get; set; }

        public virtual DateTime FechaIngreso { get; set; }

        public virtual IList<Rol> Roles { get; private set; }

        public virtual bool Activo { get; set; }

        public virtual void AddRole(Rol rol)
        {
            Roles.Add(rol);
        }
    }
}