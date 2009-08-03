using System;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using SharpArch.Core.NHibernateValidator;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [HasUniqueDomainSignature]
    public class Sede : Entity, IBaseEntity
    {
		[NotNullNotEmpty]
        [Length(40)]
        [DomainSignature]
		public virtual string Nombre { get; set; }

        [NotNullNotEmpty]
        [Length(40)]
        public virtual string Descripcion { get; set; }

		public virtual Usuario CreadorPor { get; set; }

		public virtual DateTime CreadorEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

		public virtual DateTime ModificadoEl { get; set; }

		public virtual bool Activo { get; set; }
    }
}
