using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(OrganoExternoValidator))]
    public class OrganoExternoValidatorAttribute : Attribute, IRuleArgs
    {
        public OrganoExternoValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class OrganoExternoValidator : BaseValidatorAttribute<OrganoExternoValidatorAttribute>
    {
        public override void Initialize(OrganoExternoValidatorAttribute parameters)
        {
        }

        public override bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var organoExterno = value as OrganoExterno;

            if (!organoExterno.IsTransient())
            {
                isValid &= !ValidateIsNullOrEmpty<OrganoExterno>(organoExterno, x => x.Siglas, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<OrganoExterno>(organoExterno, x => x.TipoOrgano, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<OrganoExterno>(organoExterno, x => x.TipoParticipacion, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<OrganoExterno>(organoExterno, x => x.Sector, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<OrganoExterno>(organoExterno, x => x.Nivel, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<OrganoExterno>(organoExterno, x => x.Ambito, constraintValidatorContext);
                if (organoExterno.FechaInicial <= DateTime.Parse("1980-01-01") ||
                    organoExterno.FechaFinal <= DateTime.Parse("1980-01-01"))
                {
                    isValid &= !ValidateIsNullOrEmpty<OrganoExterno>(organoExterno, x => x.FechaInicial, constraintValidatorContext);
                    isValid &= !ValidateIsNullOrEmpty<OrganoExterno>(organoExterno, x => x.FechaFinal, constraintValidatorContext);
                }
            }

            if (organoExterno.FechaInicial > DateTime.Parse("1980-01-01") ||
                organoExterno.FechaFinal > DateTime.Parse("1980-01-01"))
                isValid &= ValidateFechaInicialFinal(organoExterno, constraintValidatorContext);
            
            return isValid;
        }

    bool ValidateFechaInicialFinal(OrganoExterno organoExterno, IConstraintValidatorContext constraintValidatorContext)
    {
            var isValid = true;

            if (organoExterno.FechaInicial >= organoExterno.FechaFinal)
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