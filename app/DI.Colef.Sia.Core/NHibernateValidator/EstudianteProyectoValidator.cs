using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(EstudianteProyectoValidator))]
    public class EstudianteProyectoValidatorAttribute : Attribute, IRuleArgs
    {
        public EstudianteProyectoValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class EstudianteProyectoValidator : IValidator
    {
        public bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var estudianteProyecto = value as EstudianteProyecto;
            if (estudianteProyecto != null)
            {
                if (estudianteProyecto.TipoEstudiante == 0)
                {
                    constraintValidatorContext.DisableDefaultError();
                    constraintValidatorContext.AddInvalid<EstudianteProyecto, int>(
                        "seleccione el tipo de estudiante|TipoEstudiante", x => x.TipoEstudiante);
                    isValid = false;
                }
            }

            return isValid;
        }
    }
}