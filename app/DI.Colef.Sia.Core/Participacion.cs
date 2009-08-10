using System;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class Participacion : Entity, IBaseEntity
    {
		[NotNullNotEmpty]
		public virtual string Titulo { get; set; }

        [NotNull]
        public virtual Investigador Investigador { get; set; }

        public virtual int Puntuacion { get; set; }

		public virtual Investigador Autor { get; set; }

		public virtual OtraParticipacion OtraParticipacion { get; set; }

		public virtual TipoPresentacion TipoPresentacion { get; set; }

		public virtual string Institucion { get; set; }

		public virtual DateTime FechaPresentacion { get; set; }
        
		public virtual PeriodoReferencia PeriodoReferencia { get; set; }

		public virtual Proyecto Proyecto { get; set; }

		public virtual string Lugar { get; set; }

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
