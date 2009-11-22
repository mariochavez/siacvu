using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(CursoValidator))]
    public class CursoValidatorAttribute : Attribute, IRuleArgs
    {
        public CursoValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class CursoValidator : BaseValidatorAttribute<CursoValidatorAttribute>
    {
        public override void Initialize(CursoValidatorAttribute parameters)
        {
        }

        public override bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var curso = value as Curso;

            if (!curso.IsTransient())
            {/*
                isValid &= !ValidateIsNullOrEmpty<Curso>(curso, x => x.ProgramaEstudio, "ProgramaEstudioNombre",
                                                         constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Curso>(curso, x => x.Institucion, "InstitucionNombre",
                                                         constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Curso>(curso, x => x.NivelEstudio, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Curso>(curso, x => x.NumeroHoras, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Curso>(curso, x => x.Pais, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Curso>(curso, x => x.FechaInicial, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Curso>(curso, x => x.FechaFinal, constraintValidatorContext); */
            }

            isValid &= ValidateCurso(curso, constraintValidatorContext);

            return isValid;
        }

        private bool ValidateCurso(Curso curso, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (curso.TipoCurso == 0)
            {
                constraintValidatorContext.AddInvalid(
                    "seleccione el tipo de curso|TipoCurso", "TipoCurso");
                isValid = false;
            }
            else
            {
                if (curso.TipoCurso == 1)
                {
                    if (curso.EsDiplomado)
                    {
                        if (curso.NombreDiplomado == "")
                        {
                            constraintValidatorContext.AddInvalid(
                                "no debe ser nulo, vacío o cero|NombreDiplomado", "NombreDiplomado");
                            isValid = false;
                        }

                        isValid &= ValidateTipoCursoDiplomado(curso, constraintValidatorContext);
                    }
                    else
                    {
                        if (curso.CursoInvestigador == null)
                        {
                            constraintValidatorContext.AddInvalid(
                                "seleccione el nombre del curso|CursoInvestigador", "CursoInvestigador");
                            isValid = false;
                        }
                    }
                }
                if (curso.TipoCurso == 2)
                {
                    if (curso.NivelEstudio == null)
                    {
                        constraintValidatorContext.AddInvalid(
                            "seleccione el nivel de estudios|NivelEstudio", "NivelEstudio");
                        isValid = false;
                    }

                    if (curso.ProgramaEstudio == null)
                    {
                        constraintValidatorContext.AddInvalid(
                            "no debe ser nulo, vacío o cero|ProgramaEstudioNombre", "ProgramaEstudioNombre");
                        isValid = false;
                    }

                    if (curso.Nombre == "")
                    {
                        constraintValidatorContext.AddInvalid(
                            "no debe ser nulo, vacío o cero|Nombre", "Nombre");
                        isValid = false;
                    }

                    if (curso.Institucion == null)
                    {
                        constraintValidatorContext.AddInvalid(
                            "no debe ser nulo, vacío o cero|InstitucionNombre", "InstitucionNombre");
                        isValid = false;
                    }

                    isValid &= ValidateTipoCursoDiplomado(curso, constraintValidatorContext);
                }
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }

        private bool ValidateTipoCursoDiplomado(Curso curso, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (curso.FechaInicial <= DateTime.Parse("1910-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaInicial", "FechaInicial");
                isValid = false;
            }

            if (curso.FechaFinal <= DateTime.Parse("1910-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaFinal", "FechaFinal");
                isValid = false;
            }

            if (curso.FechaInicial > DateTime.Parse("1910-01-01") || curso.FechaFinal > DateTime.Parse("1910-01-01"))
            {
                if (curso.FechaInicial >= curso.FechaFinal)
                {
                    constraintValidatorContext.AddInvalid(
                        "fecha inicial debe ser menor a la final|FechaInicial", "FechaInicial");
                    constraintValidatorContext.AddInvalid(
                        "fecha final debe ser mayor a la inicial|FechaFinal", "FechaFinal");
                    isValid = false;
                }
            }

            if (curso.NumeroHoras <= 0)
            {
                constraintValidatorContext.AddInvalid(
                    "debe ser mayor a cero|NumeroHoras", "NumeroHoras");
                isValid = false;
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }
    }
}