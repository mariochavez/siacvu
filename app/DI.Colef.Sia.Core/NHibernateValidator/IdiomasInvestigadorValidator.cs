using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(IdiomasInvestigadorValidator))]
    public class IdiomasInvestigadorValidatorAttribute : Attribute, IRuleArgs
    {
        public IdiomasInvestigadorValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class IdiomasInvestigadorValidator: BaseValidatorAttribute<IdiomasInvestigadorValidatorAttribute>
    {
        public override void Initialize(IdiomasInvestigadorValidatorAttribute parameters)
        {
        }

        public override bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var idiomaInvestigador = value as IdiomasInvestigador;

            if (!idiomaInvestigador.IsTransient())
            {
                isValid &= !ValidateIsNullOrEmpty<IdiomasInvestigador>(idiomaInvestigador, x => x.FechaEvaluacion,
                                                                       constraintValidatorContext);
            }

            isValid &= ValidateFechas(idiomaInvestigador, constraintValidatorContext);
            isValid &= ValidateIdiomaInvestigador(idiomaInvestigador, constraintValidatorContext);

            return isValid;
        }

        bool ValidateFechas(IdiomasInvestigador idiomaInvestigador, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (idiomaInvestigador.FechaEvaluacion == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaEvaluacion", "FechaEvaluacion");
                isValid = false;
            }

            if (idiomaInvestigador.FechaEvaluacion > DateTime.Now)
            {
                constraintValidatorContext.AddInvalid(
                    "el año no puede estar en el futuro|FechaEvaluacion", "FechaEvaluacion");
                isValid = false;
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }

        bool ValidateIdiomaInvestigador(IdiomasInvestigador idiomaInvestigador, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (idiomaInvestigador.Idioma == null)
            {
                constraintValidatorContext.AddInvalid(
                    "debe seleccionar el idioma|Idioma", "Idioma");

                isValid = false;
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }
    }
}