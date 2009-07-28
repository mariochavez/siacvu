using System;
using System.Collections.Generic;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using SharpArch.Core.NHibernateValidator;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [HasUniqueDomainSignature]
    public class Investigador : Entity, IBaseEntity
    {
        public virtual Usuario Usuario { get; set; }

        public virtual DateTime FechaIngreso { get; set; }

        public virtual IList<EstatusInvestigador> EstatusInvestigador { get; private set; }

        public virtual IList<GradoAcademicoInvestigador> GradosAcademicos { get; private set; }

        public virtual IList<CargoAcademico> CargosAcademicos { get; private set; }

        public virtual IList<SNIInvestigador> SNIsInvestigador { get; private set; }

        public virtual string CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual string ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}