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
            {
                isValid &= !ValidateIsNullOrEmpty<Curso>(curso, x => x.ProgramaEstudio, "ProgramaEstudioNombre",
                                                         constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Curso>(curso, x => x.Institucion, "InstitucionNombre",
                                                         constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Curso>(curso, x => x.NivelEstudio, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Curso>(curso, x => x.NumeroHoras, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Curso>(curso, x => x.Pais, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Curso>(curso, x => x.FechaInicial, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Curso>(curso, x => x.FechaFinal, constraintValidatorContext);
            }

            isValid &= ValidateFechaInicialFinal(curso, constraintValidatorContext);

            return isValid;
        }

        bool ValidateFechaInicialFinal(Curso curso, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (curso.FechaInicial == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaInicial", "FechaInicial");
                isValid = false;
            }

            if (curso.FechaFinal == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaFinal", "FechaFinal");
                isValid = false;
            }

            if (curso.FechaInicial > DateTime.Parse("1980-01-01") || curso.FechaFinal > DateTime.Parse("1980-01-01"))
            {
                if (curso.FechaInicial < curso.PeriodoReferencia.FechaInicial ||
                    curso.FechaInicial > curso.PeriodoReferencia.FechaFinal)
                {
                    constraintValidatorContext.AddInvalid(
                        "fecha inicial debe de estar entre el periodo actual|FechaInicial", "FechaInicial");

                    isValid = false;
                }

                if (curso.FechaFinal > curso.PeriodoReferencia.FechaFinal ||
                    curso.FechaFinal < curso.PeriodoReferencia.FechaInicial)
                {
                    constraintValidatorContext.AddInvalid(
                        "fecha final debe de estar entre el periodo actual|FechaFinal", "FechaFinal");

                    isValid = false;
                }

                if (curso.FechaInicial >= curso.FechaFinal)
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