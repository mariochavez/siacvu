using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(ProyectoValidator))]
    public class ProyectoValidatorAttribute : Attribute, IRuleArgs
    {
        public ProyectoValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class ProyectoValidator : BaseValidatorAttribute<ProyectoValidatorAttribute>
    {
        public override void Initialize(ProyectoValidatorAttribute parameters)
        {
        }

        public override bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var proyecto = value as Proyecto;

            if (!proyecto.IsTransient())
            {
                isValid &= !ValidateIsNullOrEmpty<Proyecto>(proyecto, x => x.TipoProyecto, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Proyecto>(proyecto, x => x.FechaInicial, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Proyecto>(proyecto, x => x.FechaFinal, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Proyecto>(proyecto, x => x.FechaProrroga, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Proyecto>(proyecto, x => x.FechaConclusion, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Proyecto>(proyecto, x => x.FechaEntregaProducto, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Proyecto>(proyecto, x => x.EstatusProyecto, constraintValidatorContext);
            }

            isValid &= ValidateFechaInicialFinal(proyecto, constraintValidatorContext);
            isValid &= ValidateFechas(proyecto, constraintValidatorContext);
            isValid &= ValidateChecks(proyecto, constraintValidatorContext);

            return isValid;
        }

        bool ValidateChecks(Proyecto proyecto, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            
            if (proyecto.ConConvenio)
            {
                if (proyecto.Convenio == null)
                {
                    constraintValidatorContext.AddInvalid(
                        "seleccione el nombre del convenio|Convenio", "Convenio");
                    isValid = false;
                }
            }

            if (proyecto.RequiereServicioUSEG)
            {
                if (proyecto.USEG == null)
                {
                    constraintValidatorContext.AddInvalid(
                        "seleccione el servicio USEG|USEG", "USEG");
                    isValid = false;
                }
            }

            if (proyecto.ParticipaEstudiante)
            {
                if (proyecto.NombreEstudiante == "")
                {
                    constraintValidatorContext.AddInvalid(
                        "no debe ser nulo o vacío o cero|NombreEstudiante", "NombreEstudiante");
                    isValid = false;
                }

                if (proyecto.TipoEstudiante == null)
                {
                    constraintValidatorContext.AddInvalid(
                        "seleccione el tipo de estudiante|TipoEstudiante", "TipoEstudiante");
                    isValid = false;
                }

                if (proyecto.GradoAcademico == null)
                {
                    constraintValidatorContext.AddInvalid(
                        "seleccione el grado académico|GradoAcademico", "GradoAcademico");
                    isValid = false;
                }
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }

        bool ValidateFechaInicialFinal(Proyecto proyecto, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (proyecto.FechaInicial == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaInicial", "FechaInicial");
                isValid = false;
            }

            if (proyecto.FechaFinal == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaFinal", "FechaFinal");
                isValid = false;
            }

            if (proyecto.FechaInicial > DateTime.Now)
            {
                constraintValidatorContext.AddInvalid(
                    "la fecha no puede estar en el futuro|FechaInicial", "FechaInicial");
                isValid = false;
            }

            if (proyecto.FechaFinal > DateTime.Now)
            {
                constraintValidatorContext.AddInvalid(
                    "la fecha no puede estar en el futuro|FechaFinal", "FechaFinal");
                isValid = false;
            }

            if (proyecto.FechaInicial > DateTime.Parse("1910-01-01") || proyecto.FechaFinal > DateTime.Parse("1910-01-01"))
            {
                if (proyecto.FechaInicial >= proyecto.FechaFinal)
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

        bool ValidateFechas(Proyecto proyecto, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (proyecto.FechaConclusion == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaAceptacion", "FechaAceptacion");
                isValid = false;
            }

            if (proyecto.FechaEntregaProducto == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaEdicion", "FechaEdicion");
                isValid = false;
            }

            if (proyecto.FechaProrroga == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaEdicion", "FechaEdicion");
                isValid = false;
            }

            if (proyecto.FechaConclusion > DateTime.Now)
            {
                constraintValidatorContext.AddInvalid(
                    "el año no puede estar en el futuro|FechaAceptacion", "FechaAceptacion");
                isValid = false;
            }

            if (proyecto.FechaEntregaProducto > DateTime.Now)
            {
                constraintValidatorContext.AddInvalid(
                    "el año no puede estar en el futuro|FechaEdicion", "FechaEdicion");
                isValid = false;
            }

            if (proyecto.FechaProrroga > DateTime.Now)
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