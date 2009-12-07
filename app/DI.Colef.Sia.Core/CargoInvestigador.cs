using System;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class CargoInvestigador : Entity, IBaseEntity
    {
        [NotNull]
        public virtual Puesto Puesto { get; set; }

        [NotNull]
        public virtual Departamento Departamento { get; set; }

        [NotNull]
        public virtual Sede Sede { get; set; }

        public virtual Usuario CreadoPor { get; set; }

        public virtual DateTime CreadoEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }

        [Valid]
        public virtual ArchivoCargo Comprobante { get; set; }
    }
}