using System;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using SharpArch.Core.NHibernateValidator;

namespace DecisionesInteligentes.Colef.Sia.Core
{
	[HasUniqueDomainSignature]
    public class Subdisciplina : Entity, IBaseEntity
    {
		[NotNullNotEmpty]
        [Length(20)]
        [DomainSignature]
		public virtual string Nombre { get; set; }

	    public virtual string CodigoConacyt { get; set; }

	    public virtual Disciplina Disciplina { get; set; }

        public virtual Usuario CreadoPor { get; set; }

		public virtual DateTime CreadoEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

		public virtual DateTime ModificadoEl { get; set; }

		public virtual bool Activo { get; set; }
    }
}
