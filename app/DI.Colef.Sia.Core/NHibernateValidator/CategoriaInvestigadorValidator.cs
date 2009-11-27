using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(CategoriaInvestigadorValidator))]
    public class CategoriaInvestigadorValidatorAttribute : Attribute, IRuleArgs
    {
        public CategoriaInvestigadorValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class CategoriaInvestigadorValidator : IValidator
    {
        public bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var categoriaInvestigador = value as CategoriaInvestigador;
            if (categoriaInvestigador != null)
            {
                if (categoriaInvestigador.FechaInicial <= DateTime.Parse("1910-01-01"))
                {
                    constraintValidatorContext.DisableDefaultError();
                    constraintValidatorContext.AddInvalid<CategoriaInvestigador, DateTime>(
                        "fecha inicial inválida o nula|FechaInicial", x => x.FechaInicial);
                    isValid = false;
                }

                if (categoriaInvestigador.FechaFinal <= DateTime.Parse("1910-01-01"))
                {
                    constraintValidatorContext.DisableDefaultError();
                    constraintValidatorContext.AddInvalid<CategoriaInvestigador, DateTime>(
                        "fecha final inválida o nula|FechaFinal", x => x.FechaFinal);
                    isValid = false;
                }
                else if (categoriaInvestigador.FechaInicial >= categoriaInvestigador.FechaFinal)
                {
                    constraintValidatorContext.DisableDefaultError();
                    constraintValidatorContext.AddInvalid<CategoriaInvestigador, DateTime>(
                        "fecha inicial debe ser menor a fecha final|FechaInicial", x => x.FechaInicial);
                    constraintValidatorContext.AddInvalid<CategoriaInvestigador, DateTime>(
                        "fecha final debe ser mayor a fecha inicial|FechaFinal", x => x.FechaFinal);
                    isValid = false;
                }
            }

            return isValid;
        }
    }
}