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
        public virtual string Programa { get; set; }

        [NotNull]
        public virtual Institucion Institucion { get; set; }

        public virtual Usuario CreadoPor { get; set; }

        public virtual DateTime CreadoEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }

        [Valid]
        public virtual ArchivoGradoAcademico Comprobante { get; set; }
    }
}