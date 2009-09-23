using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Field | AttributeTargets.Property)]
    [ValidatorClass(typeof(NotEmptyDate))]
    public class NotEmptyDateAttribute : Attribute, IRuleArgs
    {
        public NotEmptyDateAttribute()
        {
            Message = "Fecha invalida o nula";
        }

        public string Message { get; set; }
        public DateTime? MinDate { get; set; }
    }

    public class NotEmptyDate : IInitializableValidator<NotEmptyDateAttribute>
    {
        DateTime? minDate;

        public void Initialize(NotEmptyDateAttribute parameters)
        {
            minDate = parameters.MinDate;
        }

        public bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            if (minDate == null)
                minDate = DateTime.Parse("1910-01-01");

            return (DateTime)value > minDate.Value;
        }
    }
}