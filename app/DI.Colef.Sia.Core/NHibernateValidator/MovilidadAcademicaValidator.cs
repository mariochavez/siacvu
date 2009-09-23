using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(MovilidadAcademicaValidator))]
    public class MovilidadAcademicaValidatorAttribute : Attribute, IRuleArgs
    {
        public MovilidadAcademicaValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class MovilidadAcademicaValidator : BaseValidatorAttribute<MovilidadAcademicaValidatorAttribute>
    {
        public override void Initialize(MovilidadAcademicaValidatorAttribute parameters)
        {
        }


        public override bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var movilidadAcademica = value as MovilidadAcademica;

            if (!movilidadAcademica.IsTransient())
            {
                isValid &= !ValidateIsNullOrEmpty<MovilidadAcademica>(movilidadAcademica, x => x.TipoEstancia, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<MovilidadAcademica>(movilidadAcademica, x => x.TipoInstitucion, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<MovilidadAcademica>(movilidadAcademica, x => x.FechaInicial, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<MovilidadAcademica>(movilidadAcademica, x => x.FechaFinal, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<MovilidadAcademica>(movilidadAcademica, x => x.LineaTematica, "LineaTematicaNombre",
                                                            constraintValidatorContext);
            }

            isValid &= !ValidateIsNullOrEmpty<MovilidadAcademica>(movilidadAcademica, x => x.Institucion, "InstitucionNombre",
                                               constraintValidatorContext);

            isValid &= ValidateFechas(movilidadAcademica, constraintValidatorContext);

            return isValid;
        }

        bool ValidateFechas(MovilidadAcademica movilidadAcademica, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (movilidadAcademica.FechaInicial == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaInicial", "FechaInicial");
                isValid = false;
            }

            if (movilidadAcademica.FechaFinal == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaFinal", "FechaFinal");
                isValid = false;
            }

            if (movilidadAcademica.FechaInicial > DateTime.Now)
            {
                constraintValidatorContext.AddInvalid(
                    "el año no puede estar en el futuro|FechaInicial", "FechaInicial");
                isValid = false;
            }

            if (movilidadAcademica.FechaFinal > DateTime.Now)
            {
                constraintValidatorContext.AddInvalid(
                    "el año no puede estar en el futuro|FechaFinal", "FechaFinal");
                isValid = false;
            }

            if (movilidadAcademica.FechaInicial > DateTime.Parse("1910-01-01") || movilidadAcademica.FechaFinal > DateTime.Parse("1910-01-01"))
            {
                if (movilidadAcademica.FechaInicial > movilidadAcademica.FechaFinal)
                {
                    constraintValidatorContext.AddInvalid(
                        "fecha inicial debe ser menor a la final|FechaInicial", "FechaInicial");
                    constraintValidatorContext.AddInvalid(
                        "fecha final debe ser mayor a la inicial|FechaFinal", "FechaFinal");
                    isValid = false;
                }
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }
    }
}