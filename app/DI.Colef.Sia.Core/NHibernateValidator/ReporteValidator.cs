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

            if (reporte.TipoReporte != null)
                isValid &= ValidateTipoReporte(reporte, constraintValidatorContext);

            if(reporte.EstadoProducto != null)
                isValid &= ValidateEstadoProducto(reporte, constraintValidatorContext);

            return isValid;
        }

        private bool ValidateEstadoProducto(Reporte reporte, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            //Estado Producto - Aceptado
            if (reporte.EstadoProducto == 1)
            {
                if (reporte.FechaAceptacion <= DateTime.Parse("1910-01-01"))
                {
                    constraintValidatorContext.AddInvalid(
                        "formato de fecha no válido|FechaAceptacion", "FechaAceptacion");

                    isValid = false;
                }

                if (reporte.FechaAceptacion > DateTime.Now)
                {
                    constraintValidatorContext.AddInvalid(
                        "la fecha no puede estar en el futuro|FechaAceptacion", "FechaAceptacion");
                    isValid = false;
                }
            }

            //Estado Producto - Publicado
            if (reporte.EstadoProducto == 2)
            {
                if (reporte.FechaPublicacion <= DateTime.Parse("1910-01-01"))
                {
                    constraintValidatorContext.AddInvalid(
                        "formato de fecha no válido|FechaPublicacion", "FechaPublicacion");

                    isValid = false;
                }

                if (reporte.FechaPublicacion > DateTime.Now)
                {
                    constraintValidatorContext.AddInvalid(
                        "la fecha no puede estar en el futuro|FechaPublicacion", "FechaPublicacion");
                    isValid = false;
                }
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }

        bool ValidateTipoReporte(Reporte reporte, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if(reporte.TipoReporte.Nombre.Contains("Reporte técnico"))
            {
                if (reporte.TieneProyecto)
                {
                    if (reporte.Proyecto == null)
                    {
                        constraintValidatorContext.AddInvalid("no puede ser nulo, vacío o cero|ProyectoNombre",
                                                              "ProyectoNombre");

                        isValid = false;
                    }
                }
                else
                {
                    if (reporte.PalabraClave1 == "")
                    {
                        constraintValidatorContext.AddInvalid(
                            "no debe ser nulo o vacío|PalabraClave1", "PalabraClave1");

                        isValid = false;
                    }

                    if (reporte.PalabraClave2 == "")
                    {
                        constraintValidatorContext.AddInvalid(
                            "no debe ser nulo o vacío|PalabraClave2", "PalabraClave2");

                        isValid = false;
                    }

                    if (reporte.PalabraClave3 == "")
                    {
                        constraintValidatorContext.AddInvalid(
                            "no debe ser nulo o vacío|PalabraClave3", "PalabraClave3");

                        isValid = false;
                    }
                }

            }

            if (reporte.Descripcion == "")
            {
                constraintValidatorContext.AddInvalid(
                    "no debe ser nulo o vacío|Descripcion", "Descripcion");

                isValid = false;
            }

            if (reporte.Objetivo == "")
            {
                constraintValidatorContext.AddInvalid(
                    "no debe ser nulo o vacío|Objetivo", "Objetivo");

                isValid = false;
            }

            if (reporte.NoPaginas <= 0)
            {
                constraintValidatorContext.AddInvalid(
                    "no puede ser menor o igual a cero|NoPaginas", "NoPaginas");

                isValid = false;
            }


            if (reporte.FechaEdicion <= DateTime.Parse("1910-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaEdicion", "FechaEdicion");

                isValid = false;
            }

            if (reporte.FechaEdicion > DateTime.Now)
            {
                constraintValidatorContext.AddInvalid(
                    "la fecha no puede estar en el futuro|FechaEdicion", "FechaEdicion");
                isValid = false;
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }
    }
}