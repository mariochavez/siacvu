using System;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [EstanciaInstitucionExternaValidator]
    public class EstanciaInstitucionExterna : Entity, IBaseEntity
    {
        public virtual TipoEstancia TipoEstancia { get; set; }

        public virtual bool TipoInstitucion { get; set; }

        public virtual Institucion Institucion { get; set; }

        public virtual DateTime FechaInicial { get; set; }

        public virtual DateTime FechaFinal { get; set; }

        public virtual LineaTematica LineaTematica { get; set; }

        public virtual Convenio Convenio { get; set; }

        [NotNull]
        public virtual Usuario Usuario { get; set; }

        public virtual Usuario CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}
