using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(AutorExternoProductoValidator))]
    public class AutorExternoProductoValidatorAttribute : Attribute, IRuleArgs
    {
        public AutorExternoProductoValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class AutorExternoProductoValidator : IValidator
    {
        public bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var autorExternoProducto = value as AutorExternoProducto;
            if (autorExternoProducto != null)
            {
                if (!autorExternoProducto.AutorSeOrdenaAlfabeticamente)
                {
                    if (autorExternoProducto.Posicion <= 0)
                    {
                        constraintValidatorContext.DisableDefaultError();
                        constraintValidatorContext.AddInvalid<AutorExternoProducto, int>(
                            "no debe ser menor o igual a cero|Posicion", x => x.Posicion);
                        isValid = false;
                    }
                }
            }

            return isValid;
        }
    }
}