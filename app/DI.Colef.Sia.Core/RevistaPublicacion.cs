using System;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using SharpArch.Core.NHibernateValidator;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [HasUniqueDomainSignature]
    public class RevistaPublicacion : Entity, IBaseEntity
    {
        [DomainSignature]
        [Length(150)]
        [NotNullNotEmpty]
        public virtual string Titulo { get; set; }

        [Length(50)]
        public virtual string Periodicidad { get; set; }

        [Length(50)]
        public virtual string Issn { get; set; }

        [Length(255)]
        public virtual string Detalle { get; set; }

        [Length(50)]
        public virtual string Tipo { get; set; }

        public virtual string Estado { get; set; }

        public virtual Usuario CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}
