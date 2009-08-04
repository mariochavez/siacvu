using System;
using System.Collections.Generic;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using SharpArch.Core.NHibernateValidator;

namespace DecisionesInteligentes.Colef.Sia.Core
{

    [HasUniqueDomainSignature]
    public class Usuario : Entity//, IBaseEntity
    {
        [NotNullNotEmpty]
        [Length(20)]
        public virtual string UsuarioNombre { get; set; }

        [Length(50)]
        public virtual string Clave { get; set; }

        public virtual Persona Persona { get; set; }

        public virtual IList<Rol> Roles { get; private set; }

        public virtual string CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual string ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}