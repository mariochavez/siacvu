using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(ExperienciaProfesionalValidator))]
    public class ExperienciaProfesionalValidatorAttribute : Attribute, IRuleArgs
    {
        public ExperienciaProfesionalValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class ExperienciaProfesionalValidator : BaseValidatorAttribute<ExperienciaProfesionalValidatorAttribute>
    {
        public override void Initialize(ExperienciaProfesionalValidatorAttribute parameters)
        {
        }

        public override bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var experienciaProfesional = value as ExperienciaProfesional;

            if (!experienciaProfesional.IsTransient())
            {
                isValid &= !ValidateIsNullOrEmpty<ExperienciaProfesional>(experienciaProfesional, x => x.Entidad,
                                                                   constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<ExperienciaProfesional>(experienciaProfesional, x => x.Pais,
                                                                   constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<ExperienciaProfesional>(experienciaProfesional, x => x.FechaInicial,
                                                                   constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<ExperienciaProfesional>(experienciaProfesional, x => x.FechaFinal,
                                                                          constraintValidatorContext);
            }

            isValid &= ValidateFechaInicialFinal(experienciaProfesional, constraintValidatorContext);

            return isValid;
        }

        bool ValidateFechaInicialFinal(ExperienciaProfesional experienciaProfesional, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (experienciaProfesional.FechaInicial == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaInicial", "FechaInicial");
                isValid = false;
            }

            if (experienciaProfesional.FechaFinal == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaFinal", "FechaFinal");
                isValid = false;
            }

            if (experienciaProfesional.FechaInicial > DateTime.Now)
            {
                constraintValidatorContext.AddInvalid(
                    "la fecha no puede estar en el futuro|FechaInicial", "FechaInicial");
                isValid = false;
            }

            if (experienciaProfesional.FechaFinal > DateTime.Now)
            {
                constraintValidatorContext.AddInvalid(
                    "la fecha no puede estar en el futuro|FechaFinal", "FechaFinal");
                isValid = false;
            }

            if (experienciaProfesional.FechaInicial > DateTime.Parse("1910-01-01") || experienciaProfesional.FechaFinal > DateTime.Parse("1910-01-01"))
            {
                if (experienciaProfesional.FechaInicial >= experienciaProfesional.FechaFinal)
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