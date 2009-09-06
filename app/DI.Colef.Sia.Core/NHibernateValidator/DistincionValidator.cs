using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(DistincionValidator))]
    public class DistincionValidatorAttribute : Attribute, IRuleArgs
    {
        public DistincionValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class DistincionValidator : BaseValidatorAttribute<DistincionValidatorAttribute>
    {
        public override void Initialize(DistincionValidatorAttribute parameters)
        {
        }

        public override bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var distincion = value as Distincion;

            if (!distincion.IsTransient())
            {
                isValid &= !ValidateIsNullOrEmpty<Distincion>(distincion, x => x.TipoDistincion, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Distincion>(distincion, x => x.FechaOtorgamiento, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Distincion>(distincion, x => x.Institucion, "InstitucionNombre",
                                                         constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Distincion>(distincion, x => x.Ambito, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Distincion>(distincion, x => x.Pais, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Distincion>(distincion, x => x.EstadoPais, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Distincion>(distincion, x => x.Ciudad, constraintValidatorContext);
            }

            return isValid;
        }
    }
}