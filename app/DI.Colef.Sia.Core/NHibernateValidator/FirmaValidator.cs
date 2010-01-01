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
                if (firma.TipoProducto == 3 || firma.TipoProducto == 13 || firma.TipoProducto == 15)
                {
                    if (firma.Aceptacion2 == 1)
                    {
                        if (firma.PuntuacionSieva == 0)
                        {
                            constraintValidatorContext.DisableDefaultError();
                            constraintValidatorContext.AddInvalid<Firma, decimal>(
                                "no debe ser vacío|PuntuacionSieva", x => x.PuntuacionSieva);
                            isValid = false;
                        }
                    }
                }

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