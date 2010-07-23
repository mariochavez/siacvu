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

            //isValid &= ValidateTipoAlumno(tesisDirigida, constraintValidatorContext);
            
            return isValid;
        }

        private bool ValidateTipoAlumno(TesisDirigida tesisDirigida, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (tesisDirigida.TipoTesis == 0)
            {
                constraintValidatorContext.AddInvalid(
                    "seleccione el tipo de alumno|TipoEstudiante", "TipoEstudiante");
                isValid = false;
            }
            else if (tesisDirigida.TipoTesis == 2)
            {
                if (tesisDirigida.Titulo == "")
                {
                    constraintValidatorContext.AddInvalid(
                        "no puede ser nulo, vacío o cero|Titulo", "Titulo");
                    isValid = false;
                }

                if (tesisDirigida.VinculacionAPyD == null)
                {
                    constraintValidatorContext.AddInvalid(
                        "seleccione la vinculación con la APyD|VinculacionAPyD", "VinculacionAPyD");
                    isValid = false;
                }

                //if (tesisDirigida.FormaParticipacion == null)
                //{
                //    constraintValidatorContext.AddInvalid(
                //        "seleccione la forma de participación|FormaParticipacion", "FormaParticipacion");
                //    isValid = false;
                //}

                if (tesisDirigida.NombreAlumno == "")
                {
                    constraintValidatorContext.AddInvalid(
                        "no puede ser nulo, vacío o cero|NombreAlumno", "NombreAlumno");
                    isValid = false;
                }

                if (tesisDirigida.GradoAcademico == null)
                {
                    constraintValidatorContext.AddInvalid(
                        "seleccione el grado académico|GradoAcademico", "GradoAcademico");
                    isValid = false;
                }

                if (tesisDirigida.Institucion == null)
                {
                    constraintValidatorContext.AddInvalid(
                        "no puede ser nulo, vacío o cero|InstitucionNombre", "InstitucionNombre");
                    isValid = false;
                }
            }
            else
            {
                if (tesisDirigida.TesisPosgrado == null)
                {
                    constraintValidatorContext.AddInvalid(
                        "seleccione la tesis|TesisPosgrado", "TesisPosgrado");
                    isValid = false;
                }
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }
    }
}