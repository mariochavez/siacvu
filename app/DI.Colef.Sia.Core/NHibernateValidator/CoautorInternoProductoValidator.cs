using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(CoautorInternoProductoValidator))]
    public class CoautorInternoProductoValidatorAttribute : Attribute, IRuleArgs
    {
        public CoautorInternoProductoValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class CoautorInternoProductoValidator : IValidator
    {
        public bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var coautorInternoProducto = value as CoautorInternoProducto;
            if (coautorInternoProducto != null)
            {
                if (!coautorInternoProducto.EsAlfabeticamente)
                {
                    if (coautorInternoProducto.Posicion <= 0)
                    {
                        constraintValidatorContext.DisableDefaultError();
                        constraintValidatorContext.AddInvalid<CoautorInternoProducto, int>(
                            "no debe ser menor o igual a cero|Posicion", x => x.Posicion);
                        isValid = false;
                    }
                }
            }

            return isValid;
        }
    }
}