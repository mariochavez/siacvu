using System;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using SharpArch.Core.NHibernateValidator;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [DictamenValidator]
    [HasUniqueDomainSignature]
    public class Dictamen : Entity, IBaseEntity
    {
		[DomainSignature]
		[NotNullNotEmpty]
		public virtual string Nombre { get; set; }

        [NotNull]
        public virtual Usuario Usuario { get; set; }

        public virtual int Puntuacion { get; set; }

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
