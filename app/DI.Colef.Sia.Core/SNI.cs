using System;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class SNI : Entity, IBaseEntity
    {
		[NotNullNotEmpty]
        [Length(40)]
		public virtual string Nombre { get; set; }

		public virtual string CreadorPor { get; set; }

		public virtual DateTime CreadorEl { get; set; }

		public virtual string ModificadoPor { get; set; }

		public virtual DateTime ModificadoEl { get; set; }

		public virtual bool Activo { get; set; }
    }
}
