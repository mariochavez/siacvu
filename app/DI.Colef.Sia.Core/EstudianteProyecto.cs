using System;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class EstudianteProyecto : Entity, IBaseEntity
    {
        [NotNullNotEmpty]
        public virtual string NombreEstudiante { get; set; }

        //[NotNullNotEmpty]
        public virtual int TipoEstudiante { get; set; } //Catalogo fijo TipoEstudiante

        [NotNull]
        public virtual GradoAcademico GradoAcademico { get; set; }

        public virtual Usuario CreadoPor { get; set; }

        public virtual DateTime CreadoEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}