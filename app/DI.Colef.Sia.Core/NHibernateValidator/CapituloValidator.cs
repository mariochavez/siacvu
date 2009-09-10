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
                isValid &= !ValidateIsNullOrEmpty<Capitulo>(capitulo, x => x.TipoCapitulo, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Capitulo>(capitulo, x => x.EstadoProducto, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Capitulo>(capitulo, x => x.FechaAceptacion, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Capitulo>(capitulo, x => x.FechaEdicion, constraintValidatorContext);
                //isValid &= !ValidateIsNullOrEmpty<Capitulo>(capitulo, x => x.Proyecto, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Capitulo>(capitulo, x => x.LineaTematica, "LineaTematicaNombre",
                                                            constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Capitulo>(capitulo, x => x.NombreLibro, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Capitulo>(capitulo, x => x.Editorial, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Capitulo>(capitulo, x => x.Pais, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Capitulo>(capitulo, x => x.NoPaginas, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Capitulo>(capitulo, x => x.FormaParticipacion, constraintValidatorContext);
            }

            isValid &= ValidateFechas(capitulo, constraintValidatorContext);

            if (capitulo.TipoCapitulo != null)
                isValid &= ValidateTipoCapitulo(capitulo, constraintValidatorContext);

            return isValid;
        }

        bool ValidateFechas(Capitulo capitulo, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (capitulo.FechaAceptacion == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaAceptacion", "FechaAceptacion");
                isValid = false;
            }

            if (capitulo.FechaEdicion == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaEdicion", "FechaEdicion");
                isValid = false;
            }

            if (capitulo.FechaAceptacion > DateTime.Now)
            {
                constraintValidatorContext.AddInvalid(
                    "el año no puede estar en el futuro|FechaAceptacion", "FechaAceptacion");
                isValid = false;
            }

            if (capitulo.FechaEdicion > DateTime.Now)
            {
                constraintValidatorContext.AddInvalid(
                    "el año no puede estar en el futuro|FechaEdicion", "FechaEdicion");
                isValid = false;
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }

        bool ValidateTipoCapitulo(Capitulo capitulo, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (capitulo.TipoCapitulo.Nombre.Contains("otro idioma"))
            {
                if (capitulo.Idioma == null)
                {
                    constraintValidatorContext.AddInvalid(
                        "seleccione el idioma de tradución|Idioma", "Idioma");

                    isValid = false;
                }
                if(capitulo.Traductor == "")
                {
                    constraintValidatorContext.AddInvalid(
                       "no puede ser nulo, vacío o cero|Traductor", "Traductor");

                    isValid = false;
                }
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }
    }
}
