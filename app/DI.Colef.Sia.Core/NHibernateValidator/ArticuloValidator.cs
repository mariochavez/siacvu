using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Property)]
    [ValidatorClass(typeof(ArticuloValidator))]
    public class ArticuloValidatorAttribute : Attribute, IRuleArgs
    {
        public ArticuloValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
        public Articulo Articulo { get; set; }
    }

    public class ArticuloValidator : IInitializableValidator<ArticuloValidatorAttribute>
    {
        static Articulo articulo;

        public void Initialize(ArticuloValidatorAttribute parameters)
        {
            articulo = parameters.Articulo;
        }

        public bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var articuloVal = value as Articulo;

            if (articuloVal != null)
            {
                articulo = articuloVal;
            }

            if (articulo != null)
            {
                if (articulo.EstadoProducto != null)
                {
                    if (articulo.EstadoProducto.Nombre.Contains("Publicado"))
                    {
                        if (articulo.PaginaInicial > articulo.PaginaFinal)
                        {
                            constraintValidatorContext.DisableDefaultError();
                            constraintValidatorContext.AddInvalid(
                                "Pagina inicial debe ser mayor a la final|PaginaInicial", "PaginaInicial");
                            constraintValidatorContext.AddInvalid(
                                "Pagina final debe ser mayor a la inicial|PaginaFinal", "PaginaFinal");
                            return false;
                        }
                        if (articulo.PaginaInicial == 0 && articulo.PaginaFinal == 0)
                        {
                            constraintValidatorContext.DisableDefaultError();
                            constraintValidatorContext.AddInvalid("Pagina inicial y final no puede ser cero");
                            return false;
                        }
                    }
                    return true;
                }

                return true;
            }

            return false;
        }
    }
}
