using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(CapituloValidator))]
    public class CapituloValidatorAttribute : Attribute, IRuleArgs
    {
        public CapituloValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class CapituloValidator : IValidator
    {
        public bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var capitulo = value as Articulo;
            if (capitulo != null)
            {
                return true;
            }

            return false;
        }
    }
}
