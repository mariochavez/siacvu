using System;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class CargoInvestigador : Entity, IBaseEntity
    {
        [NotNull]
        public virtual Cargo Cargo { get; set; }

        [NotNull]
        public virtual Puesto Puesto { get; set; }

        [NotNull]
        public virtual Departamento Departamento { get; set; }

        [NotNull]
        public virtual Sede Sede { get; set; }

        [NotNull]
        public virtual DireccionRegional DireccionRegional { get; set; }

        public virtual Usuario CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}