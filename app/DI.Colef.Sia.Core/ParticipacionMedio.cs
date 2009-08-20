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

        public virtual string NotaPeriodistica { get; set; }

        public virtual string PalabraClave1 { get; set; }

        public virtual string PalabraClave2 { get; set; }

        public virtual string PalabraClave3 { get; set; }

		public virtual Usuario CreadorPor { get; set; }

		public virtual DateTime CreadorEl { get; set; }

		public virtual Usuario ModificadoPor { get; set; }

		public virtual DateTime ModificadoEl { get; set; }

		public virtual bool Activo { get; set; }
    }
}
