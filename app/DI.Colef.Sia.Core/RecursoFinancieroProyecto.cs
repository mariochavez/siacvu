using System;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class RecursoFinancieroProyecto : Entity, IBaseEntity
    {
        public virtual Institucion Institucion { get; set; }

        public virtual string Recurso { get; set; }

        public virtual long Monto { get; set; }

        public virtual Moneda Moneda { get; set; }

        public virtual Usuario CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}