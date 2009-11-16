using System;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using SharpArch.Core.NHibernateValidator;

namespace DecisionesInteligentes.Colef.Sia.Core
{
	[HasUniqueDomainSignature]
    public class Institucion : Entity, IBaseEntity
    {
		[NotNullNotEmpty]
        [DomainSignature]
		public virtual string Nombre { get; set; }

        public virtual string Siglas { get; set; }

        public virtual string Sede { get; set; }

        public virtual string PaginaWeb { get; set; }

        public virtual string Email { get; set; }

        public virtual string Telefono { get; set; }

	    public virtual Pais Pais { get; set; }

        public virtual bool TipoInstitucion { get; set; }

        public virtual EstadoPais EstadoPais { get; set; }

        public virtual string Ciudad { get; set; }

        public virtual Ambito Ambito { get; set; }

        public virtual Sector Sector { get; set; }

        public virtual Usuario CreadorPor { get; set; }

		public virtual DateTime CreadorEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

		public virtual DateTime ModificadoEl { get; set; }

		public virtual bool Activo { get; set; }
    }
}