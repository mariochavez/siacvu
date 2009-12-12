using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(ProductoGeneradoProyectoValidator))]
    public class ProductoGeneradoProyectoValidatorAttribute : Attribute, IRuleArgs
    {
        public ProductoGeneradoProyectoValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class ProductoGeneradoProyectoValidator : IValidator
    {
        public bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var producto = value as ProductoGeneradoProyecto;
            if (producto != null)
            {
                if (producto.ProductoGenerado == 0)
                {
                    constraintValidatorContext.DisableDefaultError();
                    constraintValidatorContext.AddInvalid<ProductoGeneradoProyecto, int>(
                        "seleccione el tipo de producto generado|ProductoGenerado", x => x.ProductoGenerado);
                    isValid = false;
                }

                if (producto.FechaEntrega <= DateTime.Parse("1910-01-01"))
                {
                    constraintValidatorContext.DisableDefaultError();
                    constraintValidatorContext.AddInvalid<ProductoGeneradoProyecto, DateTime>(
                        "formato de fecha no válido|FechaEntrega", x => x.FechaEntrega);

                    isValid = false;
                }

                if (producto.FechaEntrega > DateTime.Now)
                {
                    constraintValidatorContext.DisableDefaultError();
                    constraintValidatorContext.AddInvalid<ProductoGeneradoProyecto, DateTime>(
                        "el año no puede estar en el futuro|FechaEntrega", x => x.FechaEntrega);

                    isValid = false;
                }
            }

            return isValid;
        }
    }
}