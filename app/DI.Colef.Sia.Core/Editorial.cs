using System;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using SharpArch.Core.NHibernateValidator;

namespace DecisionesInteligentes.Colef.Sia.Core
{
	[HasUniqueDomainSignature]
    public class Editorial : Entity, IBaseEntity
    {
		[DomainSignature]
		[NotNullNotEmpty]
        [Length(50)]
		public virtual string Nombre { get; set; }

		public virtual Institucion Institucion { get; set; }

        public virtual int TipoEditorial { get; set; }

        public virtual Pais Pais { get; set; }

        public virtual string Contacto { get; set; }

        public virtual string Email { get; set; }

        public virtual string PaginaWeb { get; set; }

        public virtual string Telefono { get; set; }

		public virtual Usuario CreadoPor { get; set; }

		public virtual DateTime CreadoEl { get; set; }

		public virtual Usuario ModificadoPor { get; set; }

		public virtual DateTime ModificadoEl { get; set; }

		public virtual bool Activo { get; set; }
    }
}
