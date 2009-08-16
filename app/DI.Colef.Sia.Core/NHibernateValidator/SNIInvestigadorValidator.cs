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
                if(sniInvestigador.FechaInicial <= DateTime.Parse("1980-01-01"))
                {
                    constraintValidatorContext.DisableDefaultError();
                    constraintValidatorContext.AddInvalid<SNIInvestigador, DateTime>("Fecha inicial invalida o nula|FechaInicial", x => x.FechaInicial);
                }
                else if (sniInvestigador.FechaFinal <= DateTime.Parse("1980-01-01"))
                {
                    constraintValidatorContext.DisableDefaultError();
                    constraintValidatorContext.AddInvalid<SNIInvestigador, DateTime>("Fecha final invalida o nula|FechaFinal", x => x.FechaFinal);
                }
                else if (sniInvestigador.FechaInicial >= sniInvestigador.FechaFinal)
                {
                    constraintValidatorContext.DisableDefaultError();
                    constraintValidatorContext.AddInvalid<SNIInvestigador, DateTime>("Fecha inicial debe ser menor a Fecha final|FechaInicial", x => x.FechaInicial);
                    constraintValidatorContext.AddInvalid<SNIInvestigador, DateTime>("Fecha inicial debe ser menor a Fecha final|FechaFinal", x => x.FechaFinal);
                    return false;
                }
                return true;
            }

            return false;
        }
    }
}
