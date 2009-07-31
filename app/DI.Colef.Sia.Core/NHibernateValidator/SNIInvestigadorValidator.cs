using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(SNIInvestigadorValidator))]
    public class SNIInvestigadorValidatorAttribute : Attribute, IRuleArgs
    {
        public SNIInvestigadorValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class SNIInvestigadorValidator : IValidator
    {
        public bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var sniInvestigador = value as SNIInvestigador;
            if (sniInvestigador != null)
            {
                if (sniInvestigador.FechaInicial >= sniInvestigador.FechaFinal)
                {
                    constraintValidatorContext.DisableDefaultError();
                    constraintValidatorContext.AddInvalid<SNIInvestigador, DateTime>("Fecha inicial debe ser menor a Fecha Final|FechaInicial", x => x.FechaInicial);
                    constraintValidatorContext.AddInvalid<SNIInvestigador, DateTime>("Fecha inicial debe ser menor a Fecha Final|FechaFinal", x => x.FechaFinal);
                    return false;
                }
                return true;
            }

            return false;
        }
    }
}
