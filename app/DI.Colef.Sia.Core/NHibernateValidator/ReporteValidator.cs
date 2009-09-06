using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(ReporteValidator))]
    public class ReporteValidatorAttribute : Attribute, IRuleArgs
    {
        public ReporteValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class ReporteValidator : BaseValidatorAttribute<ReporteValidatorAttribute>
    {
        public override void Initialize(ReporteValidatorAttribute parameters)
        {
        }

        public override bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var reporte = value as Reporte;

            if (!reporte.IsTransient())
            {
                isValid &= !ValidateIsNullOrEmpty<Reporte>(reporte, x => x.TipoReporte, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Reporte>(reporte, x => x.FechaAceptacion, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Reporte>(reporte, x => x.LineaTematica, "LineaTematicaNombre",
                                                            constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Reporte>(reporte, x => x.Pais, constraintValidatorContext);
            }

            return isValid;
        }
    }
}
