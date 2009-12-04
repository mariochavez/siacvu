using System;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [EstanciaAcademicaExternaValidator]
    public class EstanciaAcademicaExterna : Entity, IBaseEntity
    {
        [NotNull]
        public virtual Usuario Usuario { get; set; }

        public virtual GradoAcademico GradoAcademico { get; set; }

        public virtual TipoEstancia TipoEstancia { get; set; }

		public virtual Institucion Institucion { get; set; }

		public virtual string LineasInvestigacion { get; set; }

		public virtual DateTime FechaInicial { get; set; }

		public virtual DateTime FechaFinal { get; set; }

		public virtual string Actividades { get; set; }

		public virtual string Logros { get; set; }

		public virtual Usuario CreadoPor { get; set; }

		public virtual DateTime CreadoEl { get; set; }

		public virtual Usuario ModificadoPor { get; set; }

		public virtual DateTime ModificadoEl { get; set; }

		public virtual bool Activo { get; set; }
    }
}