using System;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [SNIInvestigadorValidator]
    public class SNIInvestigador : Entity, IBaseEntity
    {
        [NotEmptyDate]
        public virtual DateTime FechaInicial { get; set; }

        [NotEmptyDate]
        public virtual DateTime FechaFinal { get; set; }

        [NotNull]
        public virtual SNI SNI { get; set; }

        public virtual Usuario CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}