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
            Telefonos = new List<Telefono>();
        }

        public virtual string Nombre { get; set; }

        public virtual string ApellidoPaterno { get; set; }

        public virtual string ApellidoMaterno { get; set; }

        public virtual string UsuarioNombre { get; set; }

        public virtual string Clave { get; set; }

        public virtual string Direccion { get; set; }

        public virtual string CorreoElectronico { get; set; }

        public virtual string EstadoCivil { get; set; }

        public virtual string Sexo { get; set; }

        public virtual string DocumentosIdentidad { get; set; }

        public virtual string CURP { get; set; }

        public virtual string RFC { get; set; }

        public virtual string CedulaProfesional { get; set; }

        public virtual string Nacionalidad { get; set; }

        public virtual string CodigoRH { get; set; }

        public virtual DateTime FechaNacimiento { get; set; }

        public virtual DateTime FechaIngreso { get; set; }

        public virtual IList<Rol> Roles { get; private set; }

        public virtual IList<Telefono> Telefonos { get; private set; }

        public virtual IList<CorreoElectronico> CorreosElectronicos { get; set; }

        public virtual bool Investigador { get; set; }

        public virtual bool Activo { get; set; }

        public virtual void AddRole(Rol rol)
        {
            Roles.Add(rol);
        }

        public virtual void DeleteRole(Rol rol)
        {
            Roles.Remove(rol);
        }

        public virtual void AddTelefono(Telefono telefono)
        {
            Telefonos.Add(telefono);
        }

        public virtual void AddTelefono(string numero, int tipoTelefono)
        {
            Telefonos.Add(new Telefono {Numero = numero, TipoTelefono = tipoTelefono});
        }

        public virtual void DeleteTelefono(Telefono telefono)
        {
            Telefonos.Remove(telefono);
        }

        public virtual void AddCorreoElectronico(CorreoElectronico correoElectronico)
        {
            CorreosElectronicos.Add(correoElectronico);
        }

        public virtual void AddCorreoElectronico(string direccion, int tipoCorreo)
        {
            CorreosElectronicos.Add(new CorreoElectronico {Direccion = direccion, TipoCorreoElectronico = tipoCorreo});
        }

        public virtual void DeleteCorreoElectronico(CorreoElectronico correoElectronico)
        {
            CorreosElectronicos.Remove(correoElectronico);
        }
    }
}