using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(ParticipacionAcademiaValidator))]
    public class ParticipacionAcademiaValidatorAttribute : Attribute, IRuleArgs
    {
        public ParticipacionAcademiaValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class ParticipacionAcademiaValidator : BaseValidatorAttribute<ParticipacionAcademiaValidatorAttribute>
    {
        public override void Initialize(ParticipacionAcademiaValidatorAttribute parameters)
        {
        }

        public override bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var participacionAcademia = value as ParticipacionAcademia;

            if (!participacionAcademia.IsTransient())
            {
                //isValid &= !ValidateIsNullOrEmpty<ParticipacionAcademia>(participacionAcademia, x => x.EstadoProducto, constraintValidatorContext);
                //isValid &= !ValidateIsNullOrEmpty<ParticipacionAcademia>(participacionAcademia, x => x.FechaAceptacion, constraintValidatorContext);
                //isValid &= !ValidateIsNullOrEmpty<ParticipacionAcademia>(participacionAcademia, x => x.FechaEdicion, constraintValidatorContext);
                //isValid &= !ValidateIsNullOrEmpty<ParticipacionAcademia>(participacionAcademia, x => x.Proyecto, constraintValidatorContext);
                //isValid &= !ValidateIsNullOrEmpty<ParticipacionAcademia>(participacionAcademia, x => x.LineaTematica, "LineaTematicaNombre",
                //                                                         constraintValidatorContext);
                //isValid &= !ValidateIsNullOrEmpty<ParticipacionAcademia>(participacionAcademia, x => x.Institucion, "InstitucionNombre",
                //                                                         constraintValidatorContext);
                //isValid &= !ValidateIsNullOrEmpty<ParticipacionAcademia>(participacionAcademia, x => x.Pais, constraintValidatorContext);
                //isValid &= !ValidateIsNullOrEmpty<ParticipacionAcademia>(participacionAcademia, x => x.RevistaPublicacion, "RevistaPublicacionTitulo",
                //                                                         constraintValidatorContext);
            }

            isValid &= ValidateFechas(participacionAcademia, constraintValidatorContext);

            return isValid;
        }

        bool ValidateFechas(ParticipacionAcademia participacionAcademia, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (participacionAcademia.FechaAceptacion == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaAceptacion", "FechaAceptacion");
                isValid = false;
            }

            if (participacionAcademia.FechaEdicion == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaEdicion", "FechaEdicion");
                isValid = false;
            }

            if (participacionAcademia.FechaAceptacion > DateTime.Now)
            {
                constraintValidatorContext.AddInvalid(
                    "el año no puede estar en el futuro|FechaAceptacion", "FechaAceptacion");
                isValid = false;
            }

            if (participacionAcademia.FechaEdicion > DateTime.Now)
            {
                constraintValidatorContext.AddInvalid(
                    "el año no puede estar en el futuro|FechaEdicion", "FechaEdicion");
                isValid = false;
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }
    }
}