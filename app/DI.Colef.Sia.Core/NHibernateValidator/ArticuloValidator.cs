using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(ArticuloValidator))]
    public class ArticuloValidatorAttribute : Attribute, IRuleArgs
    {
        public ArticuloValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class ArticuloValidator : IInitializableValidator<ArticuloValidatorAttribute>
    {
        public void Initialize(ArticuloValidatorAttribute parameters)
        {
        }

        public bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var articulo = value as Articulo;

            if (articulo.EstadoProducto != null)
                return ValidateProductoEstado(articulo, constraintValidatorContext);

            return true;
        }

        bool ValidateProductoEstado(Articulo articulo, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (articulo.EstadoProducto.Nombre.Contains("Publicado"))
            {
                if (articulo.PaginaInicial > articulo.PaginaFinal)
                {
                    constraintValidatorContext.AddInvalid(
                        "página inicial debe ser menor a la final|PaginaInicial", "PaginaInicial");
                    constraintValidatorContext.AddInvalid(
                        "página final debe ser mayor a la inicial|PaginaFinal", "PaginaFinal");
                    isValid = false;
                }

                if (articulo.PaginaInicial == 0 && articulo.PaginaFinal == 0)
                {
                    constraintValidatorContext.AddInvalid("página inicial y final no pueden ser cero|PaginaInicial", "PaginaInicial");
                    constraintValidatorContext.AddInvalid("página inicial y final no pueden ser cero|PaginaFinal", "PaginaFinal");
                    isValid =  false;
                }
            }

            if(!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }
    }
}
