using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(FormacionAcademicaValidator))]
    public class FormacionAcademicaValidatorAttribute : Attribute, IRuleArgs
    {
        public FormacionAcademicaValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class FormacionAcademicaValidator : BaseValidatorAttribute<FormacionAcademicaValidatorAttribute>
    {
        public override void Initialize(FormacionAcademicaValidatorAttribute parameters)
        {
        }

        public override bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var formacionAcademica = value as FormacionAcademica;

            if (!formacionAcademica.IsTransient())
            {
                isValid &= !ValidateIsNullOrEmpty<FormacionAcademica>(formacionAcademica, x => x.Estatus, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<FormacionAcademica>(formacionAcademica, x => x.NivelEstudio, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<FormacionAcademica>(formacionAcademica, x => x.TituloTesis, constraintValidatorContext);
                //isValid &= !ValidateIsNullOrEmpty<FormacionAcademica>(formacionAcademica, x => x.EstadoPais, constraintValidatorContext);
                //TODO: Quitar todas las referencias a LineaTematica en el formato FormacionAcademica
                //isValid &= !ValidateIsNullOrEmpty<FormacionAcademica>(formacionAcademica, x => x.LineaTematica, "LineaTematicaNombre",
                //                                            constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<FormacionAcademica>(formacionAcademica, x => x.Pais, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<FormacionAcademica>(formacionAcademica, x => x.Ciudad, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<FormacionAcademica>(formacionAcademica, x => x.NumeroCedula, constraintValidatorContext);
                //isValid &= !ValidateIsNullOrEmpty<FormacionAcademica>(formacionAcademica, x => x.Institucion, "InstitucionNombre",
                //                                           constraintValidatorContext);
            }

            isValid &= ValidateFechas(formacionAcademica, constraintValidatorContext);

            return isValid;
        }

        bool ValidateFechas(FormacionAcademica formacionAcademica, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (formacionAcademica.FechaObtencion == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaObtencion", "FechaObtencion");
                isValid = false;
            }

            if (formacionAcademica.FechaObtencion > DateTime.Now)
            {
                constraintValidatorContext.AddInvalid(
                    "el año no puede estar en el futuro|FechaObtencion", "FechaObtencion");
                isValid = false;
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }
    }
}
