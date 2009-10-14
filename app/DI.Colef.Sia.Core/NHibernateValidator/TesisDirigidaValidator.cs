using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(TesisDirigidaValidator))]
    public class TesisDirigidaValidatorAttribute : Attribute, IRuleArgs
    {
        public TesisDirigidaValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class TesisDirigidaValidator : BaseValidatorAttribute<TesisDirigidaValidatorAttribute>
    {
        public override void Initialize(TesisDirigidaValidatorAttribute parameters)
        {
        }

        public override bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var tesisDirigida = value as TesisDirigida;

            if (!tesisDirigida.IsTransient())
            {/*
                isValid &= !ValidateIsNullOrEmpty<TesisDirigida>(tesisDirigida, x => x.GradoAcademico, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<TesisDirigida>(tesisDirigida, x => x.NombreAlumno, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<TesisDirigida>(tesisDirigida, x => x.FormaParticipacion, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<TesisDirigida>(tesisDirigida, x => x.ProgramaEstudio, "ProgramaEstudioNombre",
                                                          constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<TesisDirigida>(tesisDirigida, x => x.Institucion, "InstitucionNombre",
                                                          constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<TesisDirigida>(tesisDirigida, x => x.LineaTematica, "LineaTematicaNombre",
                                                          constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<TesisDirigida>(tesisDirigida, x => x.Pais, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<TesisDirigida>(tesisDirigida, x => x.FechaConclusion, constraintValidatorContext); */
            }

            //isValid &= ValidateFechas(tesisDirigida, constraintValidatorContext);

            isValid &= ValidateTipoAlumno(tesisDirigida, constraintValidatorContext);
            
            return isValid;
        }

        private bool ValidateTipoAlumno(TesisDirigida tesisDirigida, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (tesisDirigida.TipoEstudiante == 0)
            {
                constraintValidatorContext.AddInvalid(
                    "seleccione el tipo de alumno|TipoEstudiante", "TipoEstudiante");
                isValid = false;
            }
            else
            {
                if (tesisDirigida.Titulo == "")
                {
                    constraintValidatorContext.AddInvalid(
                        "no puede ser nulo, vacío o cero|Titulo", "Titulo");
                    isValid = false;
                }

                if (tesisDirigida.Concluida)
                {
                    if (tesisDirigida.FechaConclusion <= DateTime.Parse("1910-01-01"))
                    {
                        constraintValidatorContext.AddInvalid(
                            "formato de fecha no válido|FechaConclusion", "FechaConclusion");
                        isValid = false;
                    }

                    if (tesisDirigida.FechaConclusion > DateTime.Now)
                    {
                        constraintValidatorContext.AddInvalid(
                            "el año no puede estar en el futuro|FechaConclusion", "FechaConclusion");
                        isValid = false;
                    }
                }

                if (tesisDirigida.TipoEstudiante == 1)
                {
                    if (tesisDirigida.FormaParticipacion == null)
                    {
                        constraintValidatorContext.AddInvalid(
                            "seleccione la forma de participación|FormaParticipacion", "FormaParticipacion");
                        isValid = false;
                    }

                    if (tesisDirigida.Alumno == null)
                    {
                        constraintValidatorContext.AddInvalid(
                            "seleccione el nombre del alumno|Alumno", "Alumno");
                        isValid = false;
                    }

                    if (tesisDirigida.FechaGrado <= DateTime.Parse("1910-01-01"))
                    {
                        constraintValidatorContext.AddInvalid(
                            "formato de fecha no válido|FechaGrado", "FechaGrado");
                        isValid = false;
                    }

                    if (tesisDirigida.FechaGrado > DateTime.Now)
                    {
                        constraintValidatorContext.AddInvalid(
                            "el año no puede estar en el futuro|FechaGrado", "FechaGrado");
                        isValid = false;
                    }

                    if (tesisDirigida.Pais == null)
                    {
                        constraintValidatorContext.AddInvalid(
                            "seleccione el país|Pais", "Pais");
                        isValid = false;
                    }
                }

                if (tesisDirigida.TipoEstudiante == 2)
                {
                    if (tesisDirigida.GradoAcademico == null)
                    {
                        constraintValidatorContext.AddInvalid(
                            "seleccione el grado académico|GradoAcademico", "GradoAcademico");
                        isValid = false;
                    }
                }
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }
    }
}