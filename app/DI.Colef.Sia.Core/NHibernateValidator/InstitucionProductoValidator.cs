using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(InstitucionProductoValidator))]
    public class InstitucionProductoValidatorAttribute : Attribute, IRuleArgs
    {
        public InstitucionProductoValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message{ get; set;}
    }
    
    public class InstitucionProductoValidator : BaseValidatorAttribute<InstitucionProductoValidatorAttribute>
    {
        public override bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var institucionProducto = value as InstitucionProducto;
            bool isValid = true;

            if (institucionProducto.Institucion == null && String.IsNullOrEmpty(institucionProducto.InstitucionNombre))
            {
                constraintValidatorContext.AddInvalid("no debe ser nulo, vacío o cero|InstitucionNombre",
                                                      "InstitucionNombre");
                isValid = false;
            }

            return isValid;
        }
    }
}
