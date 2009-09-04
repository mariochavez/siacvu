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

    public class ArticuloValidator : BaseValidatorAttribute<ArticuloValidatorAttribute>
    {
        public override void Initialize(ArticuloValidatorAttribute parameters)
        {
        }

        public override bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var articulo = value as Articulo;

            if (!articulo.IsTransient())
            {
                isValid &= !ValidateIsNullOrEmpty<Articulo>(articulo, x => x.TipoArticulo, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Articulo>(articulo, x => x.EstadoProducto, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Articulo>(articulo, x => x.FechaAceptacion, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Articulo>(articulo, x => x.Proyecto, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Articulo>(articulo, x => x.LineaTematica, "LineaTematicaNombre",
                                                            constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Articulo>(articulo, x => x.Pais, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Articulo>(articulo, x => x.Volumen, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Articulo>(articulo, x => x.Numero, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Articulo>(articulo, x => x.RevistaPublicacion, "RevistaPublicacionTitulo",
                                                           constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Articulo>(articulo, x => x.FechaEdicion, constraintValidatorContext);
            }

            if (articulo.EstadoProducto != null)
                isValid &= ValidateProductoEstado(articulo, constraintValidatorContext);

            if (articulo.TipoArticulo != null)
                isValid &= ValidateTipoArticulo(articulo, constraintValidatorContext);

            return isValid;
        }

        

        bool ValidateTipoArticulo(Articulo articulo, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if(articulo.TipoArticulo.Nombre.Contains("otro idioma"))
                if(articulo.Idioma == null)
                {
                    constraintValidatorContext.AddInvalid(
                        "seleccione el idioma de tradución|Idioma", "Idioma");

                    isValid = false;
                }

            if (articulo.TipoArticulo.Nombre.Contains("con arbitraje"))
            {
                if (articulo.Indice1 == null)
                {
                    constraintValidatorContext.AddInvalid(
                        "seleccione el tipo de índice 1|Indice1", "Indice1");

                    isValid = false;
                }

                if (articulo.Indice2 == null)
                {
                    constraintValidatorContext.AddInvalid(
                        "seleccione el tipo de índice 2|Indice2", "Indice2");

                    isValid = false;
                }

                if (articulo.Indice3 == null)
                {
                    constraintValidatorContext.AddInvalid(
                        "seleccione el tipo de índice 3|Indice3", "Indice3");

                    isValid = false;
                }
            }

            return isValid;
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
