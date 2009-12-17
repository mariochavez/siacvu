using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(DistincionValidator))]
    public class DistincionValidatorAttribute : Attribute, IRuleArgs
    {
        public DistincionValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class DistincionValidator : BaseValidatorAttribute<DistincionValidatorAttribute>
    {
        public override void Initialize(DistincionValidatorAttribute parameters)
        {
        }

        public override bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var distincion = value as Distincion;

            if (!distincion.IsTransient())
            {/*
                isValid &= !ValidateIsNullOrEmpty<Distincion>(distincion, x => x.TipoDistincion, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Distincion>(distincion, x => x.FechaOtorgamiento, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Distincion>(distincion, x => x.Institucion, "InstitucionNombre",
                                                         constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Distincion>(distincion, x => x.Ambito, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Distincion>(distincion, x => x.Pais, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Distincion>(distincion, x => x.EstadoPais, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Distincion>(distincion, x => x.Ciudad, constraintValidatorContext); */
            }

            isValid &= ValidateFechas(distincion, constraintValidatorContext);

            if(distincion.Ambito != null)
                isValid &= ValidateAmbitoDistincion(distincion, constraintValidatorContext);

            return isValid;
        }

        bool ValidateFechas(Distincion distincion, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (distincion.FechaOtorgamiento == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaOtorgamiento", "FechaOtorgamiento");
                isValid = false;
            }

            if (distincion.FechaOtorgamiento > DateTime.Now)
            {
                constraintValidatorContext.AddInvalid(
                    "el año no puede estar en el futuro|FechaOtorgamiento", "FechaOtorgamiento");
                isValid = false;
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }

        private bool ValidateAmbitoDistincion(Distincion distincion, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            var lowerCaseName = distincion.Ambito.Nombre.ToLower();

            //Ambito - estatal
            if (lowerCaseName.Contains("estatal"))
            {
                if (distincion.EstadoPais == null)
                {
                    constraintValidatorContext.AddInvalid(
                        "seleccione el estado|EstadoPais", "EstadoPais");

                    isValid = false;
                }
            }

            //Ambito - local
            if (lowerCaseName.Contains("local/municipal"))
            {
                if (distincion.EstadoPais == null)
                {
                    constraintValidatorContext.AddInvalid(
                        "seleccione el estado|EstadoPais", "EstadoPais");

                    isValid = false;
                }

                if (distincion.Municipio == "")
                {
                    constraintValidatorContext.AddInvalid(
                        "no puede ser nulo, vacío o cero|Municipio", "Municipio");

                    isValid = false;
                }
            }

            //Ambito - nacional y regional
            if (lowerCaseName.Contains("binacional") || lowerCaseName.Contains("internacional"))
            {
                if (distincion.Pais == null)
                {
                    constraintValidatorContext.AddInvalid(
                        "seleccione el país|Pais", "Pais");

                    isValid = false;
                }
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }
    }
}