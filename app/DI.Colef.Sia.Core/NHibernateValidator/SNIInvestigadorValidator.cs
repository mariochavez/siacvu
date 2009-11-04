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
            var isValid = true;
            //var sniInvestigador = value as SNIInvestigador;
            //if (sniInvestigador != null)
            //{
            //    if(sniInvestigador.FechaInicial <= DateTime.Parse("1910-01-01"))
            //    {
            //        constraintValidatorContext.DisableDefaultError();
            //        constraintValidatorContext.AddInvalid<SNIInvestigador, DateTime>("Fecha inicial inválida o nula|FechaInicial", x => x.FechaInicial);
            //        isValid = false;
            //    }
            //    else if (sniInvestigador.FechaFinal <= DateTime.Parse("1910-01-01"))
            //    {
            //        constraintValidatorContext.DisableDefaultError();
            //        constraintValidatorContext.AddInvalid<SNIInvestigador, DateTime>("Fecha final inválida o nula|FechaFinal", x => x.FechaFinal);
            //        isValid = false;
            //    }
            //    else if (sniInvestigador.FechaInicial >= sniInvestigador.FechaFinal)
            //    {
            //        constraintValidatorContext.DisableDefaultError();
            //        constraintValidatorContext.AddInvalid<SNIInvestigador, DateTime>("Fecha inicial debe ser menor a Fecha final|FechaInicial", x => x.FechaInicial);
            //        constraintValidatorContext.AddInvalid<SNIInvestigador, DateTime>("Fecha inicial debe ser menor a Fecha final|FechaFinal", x => x.FechaFinal);
            //        isValid = false;
            //    }
            //}

            return isValid;
        }
    }
}
