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

    public class ArticuloValidator : IValidator
    {
        public bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var articulo = value as Articulo;
            if (articulo != null)
            {
                if (articulo.PaginaInicial >= articulo.PaginaFinal)
                {
                    constraintValidatorContext.DisableDefaultError();
                    constraintValidatorContext.AddInvalid<Articulo, int>("Pagina inicial debe ser menor a Pagina Final|PaginaInicial", x => x.PaginaInicial);
                    constraintValidatorContext.AddInvalid<Articulo, int>("Pagina Final debe ser mayor a Pagina Inicial|PaginaFinal", x => x.PaginaFinal);
                    return false;
                }
                return true;
            }

            return false;
        }
    }
}
