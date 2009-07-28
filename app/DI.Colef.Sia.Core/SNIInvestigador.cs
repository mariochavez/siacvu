using System;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class SNIInvestigador : Entity, IBaseEntity
    {
        public virtual DateTime FechaInicial { get; set; }

        public virtual DateTime FechaFinal { get; set; }

        [Length(40)]
        public virtual string ExpedienteSNI { get; set; }

        [Length(40)]
        public virtual string ExpedienteProduccion { get; set; }

        [Length(40)]
        public virtual string ExpedienteAcademico { get; set; }

        [Length(20)]
        public virtual string ClaveCVU { get; set; }
        
        public virtual SNI SNI { get; set; }

        public virtual string CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual string ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}