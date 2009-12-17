using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(ResenaValidator))]
    public class ResenaValidatorAttribute : Attribute, IRuleArgs
    {
        public ResenaValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class ResenaValidator : BaseValidatorAttribute<ResenaValidatorAttribute>
    {
        public override void Initialize(ResenaValidatorAttribute parameters)
        {
        }

        public override bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var resena = value as Resena;

            if (!resena.IsTransient())
            {

            }

            //if (resena.TipoResena != 0)
            //    isValid &= ValidateTipoResena(resena, constraintValidatorContext);

            if (resena.EstadoProducto != 0)
                isValid &= ValidateProductoEstado(resena, constraintValidatorContext);

            return isValid;
        }

        bool ValidateProductoEstado(Resena resena, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (resena.RevistaPublicacion == null)
            {
                constraintValidatorContext.AddInvalid(
                    "no debe ser nulo, vacío o cero|RevistaPublicacionTitulo", "RevistaPublicacionTitulo");

                isValid = false;
            }

            if (resena.EstadoProducto == 3)
            {
                if (resena.FechaPublicacion <= DateTime.Parse("1910-01-01"))
                {
                    constraintValidatorContext.AddInvalid(
                        "formato de fecha no válido|FechaPublicacion", "FechaPublicacion");

                    isValid = false;
                }

                if (resena.FechaPublicacion > DateTime.Now)
                {
                    constraintValidatorContext.AddInvalid(
                        "el año no puede estar en el futuro|FechaPublicacion", "FechaPublicacion");
                    isValid = false;
                }
            }

            if (resena.EstadoProducto == 2)
            {
                if (resena.FechaAceptacion <= DateTime.Parse("1910-01-01"))
                {
                    constraintValidatorContext.AddInvalid(
                        "formato de fecha no válido|FechaAceptacion", "FechaAceptacion");

                    isValid = false;
                }

                if (resena.FechaAceptacion > DateTime.Now)
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

        bool ValidateTipoResena(Resena resena, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (resena.TipoResena == 2)
            {
                if (resena.TituloLibro == "")
                {
                    constraintValidatorContext.AddInvalid(
                        "no debe ser nulo o vacío o cero|TituloLibro", "TituloLibro");

                    isValid = false;
                }

                if (resena.Pais == null)
                {
                    constraintValidatorContext.AddInvalid(
                        "seleccione el país|Pais", "Pais");

                    isValid = false;
                }
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }
    }
}