using System;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using SharpArch.Core.NHibernateValidator;
using System.Collections.Generic;

namespace DecisionesInteligentes.Colef.Sia.Core
{
	[HasUniqueDomainSignature]
    public class ParticipacionMedio : Entity, IBaseEntity
    {
		public ParticipacionMedio()
		{
					}
		
					
		
		[DomainSignature]
		[NotNullNotEmpty]
		public virtual string Titulo { get; set; }

		[NotNullNotEmpty]
		public virtual string Nombre { get; set; }

		public virtual MedioImpreso MedioImpreso { get; set; }

		public virtual MedioElectronico MedioElectronico { get; set; }

		public virtual string Especificacion { get; set; }

		public virtual Genero Genero { get; set; }

		public virtual string Tema { get; set; }

		public virtual PeriodoReferencia PeriodoReferencia { get; set; }

		public virtual Proyecto Proyecto { get; set; }

		public virtual LineaTematica LineaTematica { get; set; }

		public virtual Ambito Ambito { get; set; }

		public virtual DateTime FechaDifusion { get; set; }

		public virtual Pais Pais { get; set; }

		public virtual EstadoPais EstadoPais { get; set; }
		
		public virtual string Ciudad { get; set; }

		public virtual Usuario CreadorPor { get; set; }

		public virtual DateTime CreadorEl { get; set; }

		public virtual Usuario ModificadoPor { get; set; }

		public virtual DateTime ModificadoEl { get; set; }

		public virtual bool Activo { get; set; }
    }
}
