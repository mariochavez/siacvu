using System;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class Distincion : Entity, IBaseEntity
    {
        public virtual TipoDistincion TipoDistincion { get; set; }

        [NotNullNotEmpty]
        public virtual string Descripcion { get; set; }

        public virtual DateTime FechaOtorgamiento { get; set; }

        public virtual Institucion Institucion { get; set; }

        public virtual Ambito Ambito { get; set; }

        public virtual Pais Pais { get; set; }

        public virtual EstadoPais EstadoPais { get; set; }

        public virtual string Ciudad { get; set; }

        [NotNull]
        public virtual Investigador Investigador { get; set; }

        public virtual Usuario CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}
