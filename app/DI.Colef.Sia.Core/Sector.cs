using System;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using SharpArch.Core.NHibernateValidator;

namespace DecisionesInteligentes.Colef.Sia.Core
{
	[HasUniqueDomainSignature]
    public class Sector : Entity, IBaseEntity
    {
        [DomainSignature]
		[NotNullNotEmpty]
        [Length(70)]
		public virtual string Nombre { get; set; }

        public virtual string CodigoConacyt { get; set; }

        [Min(0)]
	    public virtual int TipoSector { get; set; }

		public virtual Usuario CreadorPor { get; set; }

		public virtual DateTime CreadorEl { get; set; }

		public virtual Usuario ModificadoPor { get; set; }

		public virtual DateTime ModificadoEl { get; set; }

		public virtual bool Activo { get; set; }
    }
}
