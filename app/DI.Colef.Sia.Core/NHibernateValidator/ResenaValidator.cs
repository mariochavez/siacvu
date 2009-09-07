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
                isValid &= !ValidateIsNullOrEmpty<Resena>(resena, x => x.EstadoProducto, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Resena>(resena, x => x.FechaAceptacion, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Resena>(resena, x => x.LineaTematica, "LineaTematicaNombre",
                                                            constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Resena>(resena, x => x.Pais, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Resena>(resena, x => x.FechaEdicion, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Resena>(resena, x => x.TipoResena, constraintValidatorContext);
            }

            isValid &= ValidateFechas(resena, constraintValidatorContext);

            //if (resena.TipoResena != null || resena.TipoResena == null)
                isValid &= ValidateTipoResena(resena, constraintValidatorContext);
            
            return isValid;
        }

        bool ValidateFechas(Resena resena, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (resena.FechaAceptacion == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaAceptacion", "FechaAceptacion");
                isValid = false;
            }

            if (resena.FechaEdicion == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaEdicion", "FechaEdicion");
                isValid = false;
            }

            if (resena.FechaAceptacion > DateTime.Now)
            {
                constraintValidatorContext.AddInvalid(
                    "el año no puede estar en el futuro|FechaAceptacion", "FechaAceptacion");
                isValid = false;
            }

            if (resena.FechaEdicion > DateTime.Now)
            {
                constraintValidatorContext.AddInvalid(
                    "el año no puede estar en el futuro|FechaEdicion", "FechaEdicion");
                isValid = false;
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }

        bool ValidateTipoResena(Resena resena, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (resena.TipoResena == null)
            {
                constraintValidatorContext.AddInvalid(
                    "debe seleccionar el tipo de reseña|TipoResena", "TipoResena");

                isValid = false;
            }
            else
            {

                if (resena.TipoResena.Nombre.Contains("Nota critica"))
                {
                    if (resena.NombreProducto == "")
                    {
                        constraintValidatorContext.AddInvalid(
                            "no debe ser nulo o vacío o cero|NombreProducto", "NombreProducto");

                        isValid = false;
                    }

                    if (resena.Editorial == "")
                    {
                        constraintValidatorContext.AddInvalid(
                            "no debe ser nulo o vacío o cero|Editorial", "Editorial");

                        isValid = false;
                    }
                }

                if (resena.TipoResena.Nombre.Contains("Reseña bibliografica"))
                {
                    if (resena.ReferenciaBibliograficaLibro == "")
                    {
                        constraintValidatorContext.AddInvalid(
                            "no debe ser nulo o vacío o cero|ReferenciaBibliograficaLibro",
                            "ReferenciaBibliograficaLibro");

                        isValid = false;
                    }

                    if (resena.ReferenciaBibliograficaRevista == "")
                    {
                        constraintValidatorContext.AddInvalid(
                            "no debe ser nulo o vacío o cero|ReferenciaBibliograficaRevista",
                            "ReferenciaBibliograficaRevista");

                        isValid = false;
                    }
                }
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }
    }
}
