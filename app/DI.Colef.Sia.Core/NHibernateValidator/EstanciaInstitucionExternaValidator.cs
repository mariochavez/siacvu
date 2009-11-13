using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(EstanciaInstitucionExternaValidator))]
    public class EstanciaInstitucionExternaValidatorAttribute : Attribute, IRuleArgs
    {
        public EstanciaInstitucionExternaValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class EstanciaInstitucionExternaValidator : BaseValidatorAttribute<EstanciaInstitucionExternaValidatorAttribute>
    {
        public override void Initialize(EstanciaInstitucionExternaValidatorAttribute parameters)
        {
        }


        public override bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var movilidadAcademica = value as EstanciaInstitucionExterna;

            if (!movilidadAcademica.IsTransient())
            {
                isValid &= !ValidateIsNullOrEmpty<EstanciaInstitucionExterna>(movilidadAcademica, x => x.TipoEstancia, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<EstanciaInstitucionExterna>(movilidadAcademica, x => x.TipoInstitucion, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<EstanciaInstitucionExterna>(movilidadAcademica, x => x.FechaInicial, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<EstanciaInstitucionExterna>(movilidadAcademica, x => x.FechaFinal, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<EstanciaInstitucionExterna>(movilidadAcademica, x => x.LineaTematica, "LineaTematicaNombre",
                                                            constraintValidatorContext);
            }

            isValid &= !ValidateIsNullOrEmpty<EstanciaInstitucionExterna>(movilidadAcademica, x => x.Institucion, "InstitucionNombre",
                                               constraintValidatorContext);

            isValid &= ValidateFechas(movilidadAcademica, constraintValidatorContext);

            return isValid;
        }

        bool ValidateFechas(EstanciaInstitucionExterna estanciaInstitucionExterna, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (estanciaInstitucionExterna.FechaInicial == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaInicial", "FechaInicial");
                isValid = false;
            }

            if (estanciaInstitucionExterna.FechaFinal == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaFinal", "FechaFinal");
                isValid = false;
            }

            if (estanciaInstitucionExterna.FechaInicial > DateTime.Now)
            {
                constraintValidatorContext.AddInvalid(
                    "el año no puede estar en el futuro|FechaInicial", "FechaInicial");
                isValid = false;
            }

            if (estanciaInstitucionExterna.FechaFinal > DateTime.Now)
            {
                constraintValidatorContext.AddInvalid(
                    "el año no puede estar en el futuro|FechaFinal", "FechaFinal");
                isValid = false;
            }

            if (estanciaInstitucionExterna.FechaInicial > DateTime.Parse("1910-01-01") || estanciaInstitucionExterna.FechaFinal > DateTime.Parse("1910-01-01"))
            {
                if (estanciaInstitucionExterna.FechaInicial > estanciaInstitucionExterna.FechaFinal)
                {
                    constraintValidatorContext.AddInvalid(
                        "fecha inicial debe ser menor a la final|FechaInicial", "FechaInicial");
                    constraintValidatorContext.AddInvalid(
                        "fecha final debe ser mayor a la inicial|FechaFinal", "FechaFinal");
                    isValid = false;
                }
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }
    }
}