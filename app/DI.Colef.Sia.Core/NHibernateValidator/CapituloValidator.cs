using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(CapituloValidator))]
    public class CapituloValidatorAttribute : Attribute, IRuleArgs
    {
        public CapituloValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class CapituloValidator : BaseValidatorAttribute<CapituloValidatorAttribute>
    {
        public override void Initialize(CapituloValidatorAttribute parameters)
        {
        }

        public override bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var capitulo = value as Capitulo;

            if (!capitulo.IsTransient())
            {

            }

            isValid &= TieneProyecto(capitulo, constraintValidatorContext);

            if (capitulo.EstadoProducto != 0)
                isValid &= ValidateProductoEstado(capitulo, constraintValidatorContext);

            return isValid;
        }

        bool TieneProyecto(Capitulo capitulo, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (capitulo.TieneProyecto)
            {
                if (capitulo.Proyecto == null)
                {
                    constraintValidatorContext.AddInvalid("seleccione el proyecto|ProyectoNombre", "ProyectoNombre");

                    isValid = false;
                }
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }

        bool ValidateProductoEstado(Capitulo capitulo, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (capitulo.EstadoProducto == 3)
            {
                if (capitulo.FechaPublicacion <= DateTime.Parse("1910-01-01"))
                {
                    constraintValidatorContext.AddInvalid(
                        "formato de fecha no válido|FechaPublicacion", "FechaPublicacion");

                    isValid = false;
                }

                if (capitulo.FechaPublicacion > DateTime.Now)
                {
                    constraintValidatorContext.AddInvalid(
                        "el año no puede estar en el futuro|FechaPublicacion", "FechaPublicacion");
                    isValid = false;
                }
            }

            if (capitulo.EstadoProducto == 2)
            {
                if (capitulo.FechaAceptacion <= DateTime.Parse("1910-01-01"))
                {
                    constraintValidatorContext.AddInvalid(
                        "formato de fecha no válido|FechaAceptacion", "FechaAceptacion");

                    isValid = false;
                }

                if (capitulo.FechaAceptacion > DateTime.Now)
                {
                    constraintValidatorContext.AddInvalid(
                        "el año no puede estar en el futuro|FechaAceptacion", "FechaAceptacion");
                    isValid = false;
                }
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }
    }
}