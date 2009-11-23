using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(OrganoInternoValidator))]
    public class OrganoInternoValidatorAttribute : Attribute, IRuleArgs
    {
        public OrganoInternoValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class OrganoInternoValidator : BaseValidatorAttribute<OrganoInternoValidatorAttribute>
    {
        public override void Initialize(OrganoInternoValidatorAttribute parameters)
        {
        }

        public override bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var organoInterno = value as OrganoInterno;

            if (!organoInterno.IsTransient())
            {

            }

            isValid &= ValidateFechaInicialFinal(organoInterno, constraintValidatorContext);

            isValid &= ValidateConsejoComision(organoInterno, constraintValidatorContext);

            return isValid;
        }

        private bool ValidateConsejoComision(OrganoInterno organoInterno, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (organoInterno.ConsejoComision == null)
            {
                constraintValidatorContext.AddInvalid(
                            "seleccione el consejo o comisión|ConsejoComision", "ConsejoComision");
                isValid = false;
            }
            else
            {
                if (organoInterno.ConsejoComision.Nombre != "Consejo Académico")
                {
                    if (organoInterno.Periodo == 0)
                    {
                        constraintValidatorContext.AddInvalid(
                            "seleccione el periodo|Periodo", "Periodo");
                        isValid = false;
                    }
                }
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }

        private bool ValidateFechaInicialFinal(OrganoInterno organoInterno, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (organoInterno.FechaInicial == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaInicial", "FechaInicial");
                isValid = false;
            }

            if (organoInterno.FechaFinal == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaFinal", "FechaFinal");
                isValid = false;
            }

            if (organoInterno.FechaInicial > DateTime.Parse("1910-01-01") || organoInterno.FechaFinal > DateTime.Parse("1910-01-01"))
            {
                if (organoInterno.FechaInicial >= organoInterno.FechaFinal)
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