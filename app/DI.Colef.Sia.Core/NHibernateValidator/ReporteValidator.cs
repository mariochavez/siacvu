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
            {/*
                isValid &= !ValidateIsNullOrEmpty<Reporte>(reporte, x => x.TipoReporte, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Reporte>(reporte, x => x.FechaAceptacion, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Reporte>(reporte, x => x.LineaTematica, "LineaTematicaNombre",
                                                            constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Reporte>(reporte, x => x.Pais, constraintValidatorContext); */
            }

            isValid &= ValidateFechas(reporte, constraintValidatorContext);

            if (reporte.TipoReporte != null)
                isValid &= ValidateTipoReporte(reporte, constraintValidatorContext);

            return isValid;
        }

        bool ValidateFechas(Reporte reporte, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (reporte.FechaAceptacion == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaAceptacion", "FechaAceptacion");
                isValid = false;
            }

            if (reporte.FechaEdicion == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaEdicion", "FechaEdicion");
                isValid = false;
            }

            if (reporte.Fecha == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|Fecha", "Fecha");
                isValid = false;
            }

            if (reporte.FechaAceptacion > DateTime.Now)
            {
                constraintValidatorContext.AddInvalid(
                    "el año no puede estar en el futuro|FechaAceptacion", "FechaAceptacion");
                isValid = false;
            }

            if (reporte.FechaEdicion > DateTime.Now)
            {
                constraintValidatorContext.AddInvalid(
                    "el año no puede estar en el futuro|FechaEdicion", "FechaEdicion");
                isValid = false;
            }

            if (reporte.Fecha > DateTime.Now)
            {
                constraintValidatorContext.AddInvalid(
                    "el año no puede estar en el futuro|Fecha", "Fecha");
                isValid = false;
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }

        bool ValidateTipoReporte(Reporte reporte, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (reporte.TipoReporte.Nombre.Contains("Cuaderno de trabajo"))
            {
                if (reporte.Editorial == "")
                {
                    constraintValidatorContext.AddInvalid(
                        "no debe ser nulo o vacío o cero|Editorial", "Editorial");

                    isValid = false;
                }

                if (reporte.FechaEdicion <= DateTime.Parse("1910-01-01"))
                {
                    constraintValidatorContext.AddInvalid(
                        "no debe ser nulo o vacío|FechaEdicion", "FechaEdicion");

                    isValid = false;
                }
            }

            if (reporte.TipoReporte.Nombre.Contains("Reporte técnico"))
            {
                if (reporte.Institucion == null)
                {
                    constraintValidatorContext.AddInvalid(
                        "no debe ser nulo o vacío o cero|InstitucionNombre", "InstitucionNombre");

                    isValid = false;
                }

                if (reporte.Fecha <= DateTime.Parse("1910-01-01"))
                {
                    constraintValidatorContext.AddInvalid(
                        "no debe ser nulo o vacío|Fecha", "Fecha");

                    isValid = false;
                }
            }

            return isValid;
        }
    }
}