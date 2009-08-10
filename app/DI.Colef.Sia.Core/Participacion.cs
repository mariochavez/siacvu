using System;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class Participacion : Entity, IBaseEntity
    {
		[DomainSignature]
		[NotNullNotEmpty]
		public virtual string Titulo { get; set; }

        [NotNull]
        public virtual Investigador Investigador { get; set; }

        public virtual int Puntuacion { get; set; }

        [NotNull]
		public virtual Investigador Autor { get; set; }

        [NotNull]
		public virtual OtraParticipacion OtraParticipacion { get; set; }

        [NotNull]
		public virtual TipoPresentacion TipoPresentacion { get; set; }

        [NotNullNotEmpty]
		public virtual string Institucion { get; set; }

        [NotEmptyDate]
		public virtual DateTime FechaPresentacion { get; set; }
        
        [NotNull]
		public virtual PeriodoReferencia PeriodoReferencia { get; set; }

        [NotNull]
		public virtual Proyecto Proyecto { get; set; }

        [NotNullNotEmpty]
		public virtual string Lugar { get; set; }

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
