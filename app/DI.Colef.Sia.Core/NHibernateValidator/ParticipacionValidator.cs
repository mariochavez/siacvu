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
            {
                isValid &= !ValidateIsNullOrEmpty<Participacion>(participacion, x => x.OtraParticipacion, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Participacion>(participacion, x => x.FechaPresentacion, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Participacion>(participacion, x => x.Lugar, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Participacion>(participacion, x => x.Ciudad, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Participacion>(participacion, x => x.EstadoPais, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Participacion>(participacion, x => x.Pais, constraintValidatorContext);}

            return isValid;
        }
    }
}
