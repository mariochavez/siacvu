using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(EstadoInvestigadorValidator))]
    public class EstadoInvestigadorValidatorAttribute : Attribute, IRuleArgs
    {
        public EstadoInvestigadorValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class EstadoInvestigadorValidator : IValidator
    {
        public bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var estadoInvestigador = value as EstadoInvestigador;
            if (estadoInvestigador != null)
            {
                if(estadoInvestigador.FechaInicial <= DateTime.Parse("1910-01-01"))
                {
                    constraintValidatorContext.DisableDefaultError();
                    constraintValidatorContext.AddInvalid<EstadoInvestigador, DateTime>("fecha inicial inválida o nula|FechaInicial", x => x.FechaInicial);
                    isValid = false;
                }

                if (estadoInvestigador.Estado != null && (estadoInvestigador.Estado.Nombre != "Activo" && estadoInvestigador.Estado.Nombre != "Baja"))
                {
                    if (estadoInvestigador.FechaFinal <= DateTime.Parse("1910-01-01"))
                    {
                        constraintValidatorContext.DisableDefaultError();
                        constraintValidatorContext.AddInvalid<EstadoInvestigador, DateTime>(
                            "fecha final inválida o nula|FechaFinal", x => x.FechaFinal);
                        isValid = false;
                    }
                    else if (estadoInvestigador.FechaInicial >= estadoInvestigador.FechaFinal)
                    {
                        constraintValidatorContext.DisableDefaultError();
                        constraintValidatorContext.AddInvalid<EstadoInvestigador, DateTime>(
                            "fecha inicial debe ser menor a fecha final|FechaInicial", x => x.FechaInicial);
                        constraintValidatorContext.AddInvalid<EstadoInvestigador, DateTime>(
                            "fecha final debe ser mayor a fecha inicial|FechaFinal", x => x.FechaFinal);
                        isValid = false;
                    }
                }
            }

            return isValid;
        }
    }
}
