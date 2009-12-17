using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(ApoyoConacytValidator))]
    public class ApoyoConacytValidatorAttribute : Attribute, IRuleArgs
    {
        public ApoyoConacytValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class ApoyoConacytValidator : BaseValidatorAttribute<ApoyoConacytValidatorAttribute>
    {
        public override void Initialize(ApoyoConacytValidatorAttribute parameters)
        {
        }

        public override bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var apoyoConacyt = value as ApoyoConacyt;

            if (!apoyoConacyt.IsTransient())
            {
                isValid &= !ValidateIsNullOrEmpty<ApoyoConacyt>(apoyoConacyt, x => x.SubprogramaConacyt, constraintValidatorContext);
                if (apoyoConacyt.FechaInicial <= DateTime.Parse("1910-01-01") || apoyoConacyt.FechaFinal <= DateTime.Parse("1910-01-01"))
                {
                    isValid &= !ValidateIsNullOrEmpty<ApoyoConacyt>(apoyoConacyt, x => x.FechaInicial, constraintValidatorContext);
                    isValid &= !ValidateIsNullOrEmpty<ApoyoConacyt>(apoyoConacyt, x => x.FechaFinal, constraintValidatorContext);
                }
            }

            isValid &= !ValidateIsNullOrEmpty<ApoyoConacyt>(apoyoConacyt, x => x.NoApoyo, constraintValidatorContext);

            if (apoyoConacyt.FechaInicial == DateTime.Parse("1900-01-01") || apoyoConacyt.FechaFinal == DateTime.Parse("1900-01-01"))
                isValid &= ValidateFechaInicialFinal(apoyoConacyt, constraintValidatorContext);

            if (apoyoConacyt.FechaInicial > DateTime.Parse("1910-01-01") || apoyoConacyt.FechaFinal > DateTime.Parse("1910-01-01"))
                isValid &= ValidateFechaInicialFinal(apoyoConacyt, constraintValidatorContext);

            return isValid;
        }

        bool ValidateFechaInicialFinal(ApoyoConacyt apoyoConacyt, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (apoyoConacyt.FechaInicial == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaInicial", "FechaInicial");
                isValid = false;
            }

            if (apoyoConacyt.FechaFinal == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaFinal", "FechaFinal");
                isValid = false;
            }

            if (apoyoConacyt.FechaInicial >= apoyoConacyt.FechaFinal)
            {
                constraintValidatorContext.AddInvalid(
                    "fecha inicial debe ser menor a la final|FechaInicial", "FechaInicial");
                constraintValidatorContext.AddInvalid(
                    "fecha final debe ser mayor a la inicial|FechaFinal", "FechaFinal");
                isValid = false;
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }
    }
}