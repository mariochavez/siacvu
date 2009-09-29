using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(RevistaPublicacionValidator))]
    public class RevistaPublicacionValidatorAttribute : Attribute, IRuleArgs
    {
        public RevistaPublicacionValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class RevistaPublicacionValidator : BaseValidatorAttribute<RevistaPublicacionValidatorAttribute>
    {
        public override void Initialize(RevistaPublicacionValidatorAttribute parameters)
        {
        }

        public override bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var revistaPublicacion = value as RevistaPublicacion;

            isValid &= !ValidateIsNullOrEmpty<RevistaPublicacion>(revistaPublicacion, x => x.Institucion, "InstitucionNombre",
                                            constraintValidatorContext);
            isValid &= !ValidateIsNullOrEmpty<RevistaPublicacion>(revistaPublicacion, x => x.Pais, constraintValidatorContext);

            return isValid;
        }
    }
}