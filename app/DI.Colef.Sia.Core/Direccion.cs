using System;
using System.Collections.Generic;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class Direccion : Entity, IBaseEntity
    {
        [NotNullNotEmpty]
        public virtual string LineaDireccion { get; set; }

        public virtual Pais Pais { get; set; }

        public virtual EstadoPais EstadoPais { get; set; }

        public virtual string Ciudad { get; set; }

        public virtual Usuario CreadoPor { get; set; }

        public virtual DateTime CreadoEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }

        public virtual IList<Usuario> Usuarios { get; private set; }

        public virtual void AddUsuario(Usuario usuario)
        {
            Usuarios.Add(usuario);
        }
    }
}
