using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(DictamenValidator))]
    public class DictamenValidatorAttribute : Attribute, IRuleArgs
    {
        public DictamenValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class DictamenValidator : BaseValidatorAttribute<DictamenValidatorAttribute>
    {
        public override void Initialize(DictamenValidatorAttribute parameters)
        {
        }

        public override bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var dictamen = value as Dictamen;

            if (!dictamen.IsTransient())
            {
                isValid &= !ValidateIsNullOrEmpty<Dictamen>(dictamen, x => x.TipoDictamen, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Dictamen>(dictamen, x => x.TipoParticipacion,
                                                            constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Dictamen>(dictamen, x => x.Institucion, "InstitucionNombre", constraintValidatorContext);
            }

            return isValid;
        }
    }
}