using System;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using SharpArch.Core.NHibernateValidator;

namespace DecisionesInteligentes.Colef.Sia.Core
{
	[HasUniqueDomainSignature]
    public class TipoParticipacion : Entity, IBaseEntity
    {
        [NotNullNotEmpty]
        [Length(40)]
        [DomainSignature]		
		public virtual string Nombre { get; set; }

        [Min(1)]
	    public virtual int Tipo { get; set; }

        public virtual Usuario CreadorPor { get; set; }

		public virtual DateTime CreadorEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

		public virtual DateTime ModificadoEl { get; set; }

		public virtual bool Activo { get; set; }
    }
}
