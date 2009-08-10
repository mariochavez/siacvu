using System;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class ParticipacionMedio : Entity, IBaseEntity
    {
		[DomainSignature]
		[NotNullNotEmpty]
		public virtual string Titulo { get; set; }

        [NotNull]
        public virtual Investigador Investigador { get; set; }

        public virtual int Puntuacion { get; set; }

		[NotNullNotEmpty]
		public virtual string Nombre { get; set; }

        [NotNull]
		public virtual MedioImpreso MedioImpreso { get; set; }

        [NotNull]
		public virtual MedioElectronico MedioElectronico { get; set; }

        [NotNullNotEmpty]
		public virtual string Especificacion { get; set; }
        
        [NotNull]
		public virtual Genero Genero { get; set; }

        [NotNullNotEmpty]
		public virtual string Tema { get; set; }

        [NotNull]
		public virtual PeriodoReferencia PeriodoReferencia { get; set; }

        [NotNull]
		public virtual Proyecto Proyecto { get; set; }

        [NotNull]
		public virtual LineaTematica LineaTematica { get; set; }

        [NotNull]
		public virtual Ambito Ambito { get; set; }

        [NotEmptyDate]
        public virtual DateTime FechaDifusion { get; set; }

        [NotNull]
		public virtual Pais Pais { get; set; }

        [NotNull]
		public virtual EstadoPais EstadoPais { get; set; }

        [NotNullNotEmpty]
		public virtual string Ciudad { get; set; }

		public virtual Usuario CreadorPor { get; set; }

		public virtual DateTime CreadorEl { get; set; }

		public virtual Usuario ModificadoPor { get; set; }

		public virtual DateTime ModificadoEl { get; set; }

		public virtual bool Activo { get; set; }
    }
}
