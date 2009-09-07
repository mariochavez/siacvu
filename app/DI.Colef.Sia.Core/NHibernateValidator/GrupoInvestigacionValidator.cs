using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(GrupoInvestigacionValidator))]
    public class GrupoInvestigacionValidatorAttribute : Attribute, IRuleArgs
    {
        public GrupoInvestigacionValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class GrupoInvestigacionValidator : BaseValidatorAttribute<GrupoInvestigacionValidatorAttribute>
    {
        public override void Initialize(GrupoInvestigacionValidatorAttribute parameters)
        {
        }

        public override bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var grupoInvestigacion = value as GrupoInvestigacion;

            if (!grupoInvestigacion.IsTransient())
            {
                isValid &= !ValidateIsNullOrEmpty<GrupoInvestigacion>(grupoInvestigacion, x => x.FechaCreacion, constraintValidatorContext);
            }

            isValid &= ValidateFechas(grupoInvestigacion, constraintValidatorContext);

            return isValid;
        }

        bool ValidateFechas(GrupoInvestigacion grupoInvestigacion, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (grupoInvestigacion.FechaCreacion == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaCreacion", "FechaCreacion");
                isValid = false;
            }

            if (grupoInvestigacion.FechaCreacion > DateTime.Now)
            {
                constraintValidatorContext.AddInvalid(
                    "el año no puede estar en el futuro|FechaCreacion", "FechaCreacion");
                isValid = false;
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }
    }
}