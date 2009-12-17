using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(ParticipacionMedioValidator))]
    public class ParticipacionMedioValidatorAttribute : Attribute, IRuleArgs
    {
        public ParticipacionMedioValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class ParticipacionMedioValidator : BaseValidatorAttribute<ParticipacionMedioValidatorAttribute>
    {
        public override void Initialize(ParticipacionMedioValidatorAttribute parameters)
        {
        }

        public override bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var participacionMedio = value as ParticipacionMedio;

            if (!participacionMedio.IsTransient())
            {/*
                isValid &= !ValidateIsNullOrEmpty<ParticipacionMedio>(participacionMedio, x => x.MedioImpreso, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<ParticipacionMedio>(participacionMedio, x => x.MedioElectronico, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<ParticipacionMedio>(participacionMedio, x => x.Genero, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<ParticipacionMedio>(participacionMedio, x => x.LineaTematica, "LineaTematicaNombre",
                                                            constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<ParticipacionMedio>(participacionMedio, x => x.Pais, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<ParticipacionMedio>(participacionMedio, x => x.Tema, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<ParticipacionMedio>(participacionMedio, x => x.Nombre, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<ParticipacionMedio>(participacionMedio, x => x.Ciudad, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<ParticipacionMedio>(participacionMedio, x => x.EstadoPais, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<ParticipacionMedio>(participacionMedio, x => x.FechaDifusion, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<ParticipacionMedio>(participacionMedio, x => x.Ambito, constraintValidatorContext); */
            }

            isValid &= ValidateFechas(participacionMedio, constraintValidatorContext);

            return isValid;
        }

        bool ValidateFechas(ParticipacionMedio participacionMedio, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (participacionMedio.FechaPresentacion == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaPresentacion", "FechaPresentacion");
                isValid = false;
            }

            if (participacionMedio.FechaPresentacion > DateTime.Now)
            {
                constraintValidatorContext.AddInvalid(
                    "el año no puede estar en el futuro|FechaPresentacion", "FechaPresentacion");
                isValid = false;
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }
    }
}
