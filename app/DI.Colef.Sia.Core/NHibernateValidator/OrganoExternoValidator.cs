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
            {/*
                isValid &= !ValidateIsNullOrEmpty<OrganoExterno>(organoExterno, x => x.Siglas, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<OrganoExterno>(organoExterno, x => x.TipoOrgano, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<OrganoExterno>(organoExterno, x => x.Participacion,
                                                         constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<OrganoExterno>(organoExterno, x => x.Sector, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<OrganoExterno>(organoExterno, x => x.Ambito, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<OrganoExterno>(organoExterno, x => x.FechaInicial, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<OrganoExterno>(organoExterno, x => x.FechaFinal, constraintValidatorContext); */
            }

            isValid &= ValidateFechaInicialFinal(organoExterno, constraintValidatorContext);

            return isValid;
        }

        bool ValidateFechaInicialFinal(OrganoExterno organoExterno, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (organoExterno.FechaInicial == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaInicial", "FechaInicial");
                isValid = false;
            }

            if (organoExterno.FechaFinal == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaFinal", "FechaFinal");
                isValid = false;
            }

            if (organoExterno.FechaInicial > DateTime.Now)
            {
                constraintValidatorContext.AddInvalid(
                    "el año no puede estar en el futuro|FechaInicial", "FechaInicial");
                isValid = false;
            }

            if (organoExterno.FechaFinal > DateTime.Now)
            {
                constraintValidatorContext.AddInvalid(
                    "el año no puede estar en el futuro|FechaFinal", "FechaFinal");
                isValid = false;
            }

            if (organoExterno.FechaInicial > DateTime.Parse("1910-01-01") || organoExterno.FechaFinal > DateTime.Parse("1910-01-01"))
            {

                if (organoExterno.FechaInicial >= organoExterno.FechaFinal)
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