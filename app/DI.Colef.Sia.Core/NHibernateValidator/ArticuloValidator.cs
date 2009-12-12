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
                
            }

            isValid &= TieneProyecto(articulo, constraintValidatorContext);

            if (articulo.EstadoProducto != 0)
                isValid &= ValidateProductoEstado(articulo, constraintValidatorContext);

            return isValid;
        }

        bool TieneProyecto(Articulo articulo, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (articulo.TieneProyecto)
            {
                if (articulo.Proyecto == null)
                {
                    constraintValidatorContext.AddInvalid("seleccione el proyecto|ProyectoNombre", "ProyectoNombre");

                    isValid = false;
                }
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }

        bool ValidateProductoEstado(Articulo articulo, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (articulo.RevistaPublicacion == null)
            {
                constraintValidatorContext.AddInvalid(
                    "no debe ser nulo, vacío o cero|RevistaPublicacionTitulo", "RevistaPublicacionTitulo");

                isValid = false;
            }

            if (articulo.EstadoProducto == 3)
            {
                if (articulo.FechaPublicacion <= DateTime.Parse("1910-01-01"))
                {
                    constraintValidatorContext.AddInvalid(
                        "formato de fecha no válido|FechaPublicacion", "FechaPublicacion");

                    isValid = false;
                }

                if (articulo.FechaPublicacion > DateTime.Now)
                {
                    constraintValidatorContext.AddInvalid(
                        "el año no puede estar en el futuro|FechaPublicacion", "FechaPublicacion");
                    isValid = false;
                }
            }

            if (articulo.EstadoProducto == 2)
            {
                if (articulo.FechaAceptacion <= DateTime.Parse("1910-01-01"))
                {
                    constraintValidatorContext.AddInvalid(
                        "formato de fecha no válido|FechaAceptacion", "FechaAceptacion");

                    isValid = false;
                }

                if (articulo.FechaAceptacion > DateTime.Now)
                {
                    constraintValidatorContext.AddInvalid(
                        "el año no puede estar en el futuro|FechaAceptacion", "FechaAceptacion");
                    isValid = false;
                }
            }

            if(!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }
    }
}