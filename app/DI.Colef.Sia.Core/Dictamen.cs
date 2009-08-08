using System;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using SharpArch.Core.NHibernateValidator;
using System.Collections.Generic;

namespace DecisionesInteligentes.Colef.Sia.Core
{
	[HasUniqueDomainSignature]
    public class Dictamen : Entity, IBaseEntity
    {
		public Dictamen()
		{
					}
		
					
		
		[DomainSignature]
		[NotNullNotEmpty]
		public virtual string Nombre { get; set; }

		public virtual TipoDictamen TipoDictamen { get; set; }

		public virtual TipoParticipacion TipoParticipacion { get; set; }

		public virtual Institucion Institucion { get; set; }

		public virtual PeriodoReferencia PeriodoReferencia { get; set; }

		public virtual Usuario CreadorPor { get; set; }

		public virtual DateTime CreadorEl { get; set; }

		public virtual Usuario ModificadoPor { get; set; }

		public virtual DateTime ModificadoEl { get; set; }

		public virtual bool Activo { get; set; }
    }
}
