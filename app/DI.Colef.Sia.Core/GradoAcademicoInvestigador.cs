using System;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class GradoAcademicoInvestigador : Entity, IBaseEntity
    {
        [NotEmptyDate]
        public virtual DateTime Fecha { get; set; }

        [NotNull]
        public virtual GradoAcademico GradoAcademico { get; set; }

        [Length(40)]
        [NotNullNotEmpty]
        public virtual string Descripcion { get; set; }

        [Length(40)]
        [NotNullNotEmpty]
        public virtual string AreaInvestigacion { get; set; }

        [Length(100)]
        public virtual string Detalle { get; set; }

        public virtual string CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual string ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}