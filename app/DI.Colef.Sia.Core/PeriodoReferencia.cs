using System;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using SharpArch.Core.NHibernateValidator;

namespace DecisionesInteligentes.Colef.Sia.Core
{
	[HasUniqueDomainSignature]
    public class PeriodoReferencia : Entity, IBaseEntity
    {
		[DomainSignature]
        [Length(50)]
		[NotNullNotEmpty]
		public virtual string Periodo { get; set; }
		
		public virtual int Orden { get; set; }
		
		public virtual DateTime FechaInicial { get; set; }
		
		public virtual DateTime FechaFinal { get; set; }

		public virtual string CreadorPor { get; set; }

		public virtual DateTime CreadorEl { get; set; }

		public virtual string ModificadoPor { get; set; }

		public virtual DateTime ModificadoEl { get; set; }

		public virtual bool Activo { get; set; }
    }
}
