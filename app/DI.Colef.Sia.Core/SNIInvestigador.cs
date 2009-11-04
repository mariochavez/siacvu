using System;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    //[SNIInvestigadorValidator]
    public class SNIInvestigador : Entity, IBaseEntity
    {
        [NotEmptyDate]
        public virtual DateTime Fecha { get; set; }

        [Length(40)]
        public virtual string ExpedienteSNI { get; set; }

        [NotNull]
        public virtual SNI SNI { get; set; }

        public virtual Usuario CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}