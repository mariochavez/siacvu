using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(ParticipacionValidator))]
    public class ParticipacionValidatorAttribute : Attribute, IRuleArgs
    {
        public ParticipacionValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class ParticipacionValidator : BaseValidatorAttribute<ParticipacionValidatorAttribute>
    {
        public override void Initialize(ParticipacionValidatorAttribute parameters)
        {
        }

        public override bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var participacion = value as Participacion;

            if (!participacion.IsTransient())
            {/*
                isValid &= !ValidateIsNullOrEmpty<Participacion>(participacion, x => x.OtraParticipacion, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Participacion>(participacion, x => x.FechaPresentacion, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Participacion>(participacion, x => x.Lugar, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Participacion>(participacion, x => x.Ciudad, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Participacion>(participacion, x => x.EstadoPais, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Participacion>(participacion, x => x.Pais, constraintValidatorContext); */
            }

            isValid &= ValidateFechas(participacion, constraintValidatorContext);

            if (participacion.OtraParticipacion != null)
                isValid &= ValidateTipoParticipacion(participacion, constraintValidatorContext);

            return isValid;
        }

        bool ValidateFechas(Participacion participacion, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (participacion.FechaPresentacion == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaPresentacion", "FechaPresentacion");
                isValid = false;
            }

            if (participacion.FechaPresentacion > DateTime.Now)
            {
                constraintValidatorContext.AddInvalid(
                    "el año no puede estar en el futuro|FechaPresentacion", "FechaPresentacion");
                isValid = false;
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }

        bool ValidateTipoParticipacion(Participacion participacion, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (participacion.OtraParticipacion.Nombre.Contains("Presentacion de libro"))
            {
                if (participacion.Autor == null)
                {
                    constraintValidatorContext.AddInvalid(
                        "seleccione el autor|Autor", "Autor");

                    isValid = false;
                }

                if (participacion.TipoPresentacion == null)
                {
                    constraintValidatorContext.AddInvalid(
                        "seleccione el tipo de presentación|TipoPresentacion", "TipoPresentacion");

                    isValid = false;
                }
            }

            if (participacion.OtraParticipacion.Nombre.Contains("Platicas"))
            {
                if (participacion.Institucion == null)
                {
                    constraintValidatorContext.AddInvalid(
                        "no debe ser nulo o vacío o cero|InstitucionNombre", "InstitucionNombre");

                    isValid = false;
                }
            }

            if (participacion.OtraParticipacion.Nombre.Contains("Presentacion de resultados de investigacion"))
            {
                if (participacion.Proyecto == null)
                {
                    constraintValidatorContext.AddInvalid(
                        "seleccione el proyecto|Proyecto", "Proyecto");

                    isValid = false;
                }
            }

            return isValid;
        }
    }
}
