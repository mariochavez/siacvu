using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(EstanciaAcademicaExternaValidator))]
    public class EstanciaAcademicaExternaValidatorAttribute : Attribute, IRuleArgs
    {
        public EstanciaAcademicaExternaValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class EstanciaAcademicaExternaValidator : BaseValidatorAttribute<EstanciaAcademicaExternaValidatorAttribute>
    {
        public override void Initialize(EstanciaAcademicaExternaValidatorAttribute parameters)
        {
        }


        public override bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var estanciaAcademicaExterna = value as EstanciaAcademicaExterna;

            if (!estanciaAcademicaExterna.IsTransient())
            {
                isValid &= !ValidateIsNullOrEmpty<EstanciaAcademicaExterna>(estanciaAcademicaExterna, x => x.TipoEstancia, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<EstanciaAcademicaExterna>(estanciaAcademicaExterna, x => x.FechaInicial, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<EstanciaAcademicaExterna>(estanciaAcademicaExterna, x => x.FechaFinal, constraintValidatorContext);
            }

            isValid &= !ValidateIsNullOrEmpty<EstanciaAcademicaExterna>(estanciaAcademicaExterna, x => x.Institucion, "InstitucionNombre",
                                               constraintValidatorContext);

            isValid &= ValidateFechaInicialFinal(estanciaAcademicaExterna, constraintValidatorContext);

            return isValid;
        }

        private bool ValidateFechaInicialFinal(EstanciaAcademicaExterna estanciaAcademicaExterna, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (estanciaAcademicaExterna.FechaInicial == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaInicial", "FechaInicial");
                isValid = false;
            }

            if (estanciaAcademicaExterna.FechaFinal == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaFinal", "FechaFinal");
                isValid = false;
            }

            if (estanciaAcademicaExterna.FechaInicial > DateTime.Parse("1910-01-01") || estanciaAcademicaExterna.FechaFinal > DateTime.Parse("1910-01-01"))
            {
                if (estanciaAcademicaExterna.FechaInicial > estanciaAcademicaExterna.FechaFinal)
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