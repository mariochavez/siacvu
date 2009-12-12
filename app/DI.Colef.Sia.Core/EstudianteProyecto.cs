using System;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [EstudianteProyectoValidator]
    public class EstudianteProyecto : Entity, IBaseEntity
    {
        [NotNullNotEmpty]
        public virtual string NombreEstudiante { get; set; }

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