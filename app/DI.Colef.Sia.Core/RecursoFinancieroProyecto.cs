using System;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class RecursoFinancieroProyecto : Entity, IBaseEntity
    {
        [NotNull]
        public virtual Institucion Institucion { get; set; }

        //[NotNullNotEmpty]
        public virtual long Monto { get; set; }

        [NotNull]
        public virtual Moneda Moneda { get; set; }

        public virtual Usuario CreadoPor { get; set; }

        public virtual DateTime CreadoEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}