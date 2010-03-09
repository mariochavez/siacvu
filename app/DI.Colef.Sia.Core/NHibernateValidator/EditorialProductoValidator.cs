using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(EditorialProductoValidator))]
    public class EditorialProductoValidatorAttribute : Attribute, IRuleArgs
    {
        public EditorialProductoValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class EditorialProductoValidator : BaseValidatorAttribute<EditorialProductoValidatorAttribute>
    {
        public override bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var editorialProducto = value as EditorialProducto;
            bool isValid = true; 
            
            if(editorialProducto.Editorial == null && String.IsNullOrEmpty(editorialProducto.EditorialNombre))
            {
                constraintValidatorContext.AddInvalid(
                        "no debe ser nulo, vacío o cero|EditorialNombre", "EditorialNombre");
                isValid = false;
            }

            return isValid;
        }
    }
}
