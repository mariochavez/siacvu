using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(FirmaValidator))]
    public class FirmaValidatorAttribute : Attribute, IRuleArgs
    {
        public FirmaValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class FirmaValidator : IValidator
    {
        public bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var firma = value as Firma;
            if (firma != null)
            {
                if (firma.Aceptacion2 == 2 && firma.Descripcion == String.Empty)
                {
                    constraintValidatorContext.DisableDefaultError();
                    constraintValidatorContext.AddInvalid<Firma, string>(
                        "no debe ser vacío|Descripcion", x => x.Descripcion);
                    isValid = false;
                }
            }

            return isValid;
        }
    }
}