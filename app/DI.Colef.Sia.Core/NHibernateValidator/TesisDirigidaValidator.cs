using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(TesisDirigidaValidator))]
    public class TesisDirigidaValidatorAttribute : Attribute, IRuleArgs
    {
        public TesisDirigidaValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class TesisDirigidaValidator : BaseValidatorAttribute<TesisDirigidaValidatorAttribute>
    {
        public override void Initialize(TesisDirigidaValidatorAttribute parameters)
        {
        }

        public override bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var tesisDirigida = value as TesisDirigida;

            if (!tesisDirigida.IsTransient())
            {
                isValid &= !ValidateIsNullOrEmpty<TesisDirigida>(tesisDirigida, x => x.GradoAcademico, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<TesisDirigida>(tesisDirigida, x => x.NombreAlumno, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<TesisDirigida>(tesisDirigida, x => x.FormaParticipacion, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<TesisDirigida>(tesisDirigida, x => x.ProgramaEstudio, "ProgramaEstudioNombre",
                                                          constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<TesisDirigida>(tesisDirigida, x => x.Institucion, "InstitucionNombre",
                                                          constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<TesisDirigida>(tesisDirigida, x => x.LineaTematica, "LineaTematicaNombre",
                                                          constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<TesisDirigida>(tesisDirigida, x => x.Pais, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<TesisDirigida>(tesisDirigida, x => x.FechaConclusion, constraintValidatorContext);
            }

            if (tesisDirigida.GradoAcademico != null)
                isValid &= ValidateGradoAcademico(tesisDirigida, constraintValidatorContext);
            
            return isValid;
        }

        bool ValidateGradoAcademico(TesisDirigida tesisDirigida, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            
            if (tesisDirigida.FechaGrado == null)
            {
                constraintValidatorContext.AddInvalid("no puede ser nulo, vacío o cero|FechaGrado", "FechaGrado");
                isValid = false;
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }
    }
}