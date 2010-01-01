using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(CoautorExternoProductoValidator))]
    public class CoautorExternoProductoValidatorAttribute : Attribute, IRuleArgs
    {
        public CoautorExternoProductoValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class CoautorExternoProductoValidator : IValidator
    {
        public bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var coautorExternoProducto = value as CoautorExternoProducto;
            if (coautorExternoProducto != null)
            {
                if (!coautorExternoProducto.EsAlfabeticamente)
                {
                    if (coautorExternoProducto.Posicion <= 0)
                    {
                        constraintValidatorContext.DisableDefaultError();
                        constraintValidatorContext.AddInvalid<CoautorExternoProducto, int>(
                            "no debe ser menor o igual a cero|Posicion", x => x.Posicion);
                        isValid = false;
                    }
                }
            }

            return isValid;
        }
    }
}