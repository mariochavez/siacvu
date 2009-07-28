using System;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class GradoAcademicoInvestigador : Entity, IBaseEntity
    {
        public virtual DateTime Fecha { get; set; }

        public virtual GradoAcademico GradoAcademico { get; set; }

        [Length(40)]
        public virtual string Descripcion { get; set; }

        [Length(60)]
        public virtual string AreaInvestigacion { get; set; }

        public virtual string Detalle { get; set; }

        public virtual string CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual string ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}