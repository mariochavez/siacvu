using System;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
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
		
        [NotNull]
		public virtual int Orden { get; set; }
		
        [NotEmptyDate]
		public virtual DateTime FechaInicial { get; set; }
		
        [NotEmptyDate]
		public virtual DateTime FechaFinal { get; set; }

		public virtual Usuario CreadorPor { get; set; }

		public virtual DateTime CreadorEl { get; set; }

		public virtual Usuario ModificadoPor { get; set; }

		public virtual DateTime ModificadoEl { get; set; }

		public virtual bool Activo { get; set; }
    }
}
