using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(EventoValidator))]
    public class EventoValidatorAttribute : Attribute, IRuleArgs
    {
        public EventoValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class EventoValidator : BaseValidatorAttribute<EventoValidatorAttribute>
    {
        public override bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var evento = value as Evento;

            if (evento != null)
            {
                if (evento.TipoParticipacion != null)
                    isValid &= ValidateTipoParticipacion(evento, constraintValidatorContext);

                if (evento.FechaInicial <= DateTime.Parse("1910-01-01"))
                {
                    constraintValidatorContext.DisableDefaultError();
                    constraintValidatorContext.AddInvalid<Evento, DateTime>(
                        "fecha inicial inválida o nula|FechaInicial", x => x.FechaInicial);
                    isValid = false;
                }

                if (evento.FechaFinal <= DateTime.Parse("1910-01-01"))
                {
                    constraintValidatorContext.DisableDefaultError();
                    constraintValidatorContext.AddInvalid<Evento, DateTime>(
                        "fecha final inválida o nula|FechaFinal", x => x.FechaFinal);
                    isValid = false;
                }
                else if (evento.FechaInicial >= evento.FechaFinal)
                {
                    constraintValidatorContext.DisableDefaultError();
                    constraintValidatorContext.AddInvalid<Evento, DateTime>(
                        "fecha inicial debe ser menor a fecha final|FechaInicial", x => x.FechaInicial);
                    constraintValidatorContext.AddInvalid<Evento, DateTime>(
                        "fecha final debe ser mayor a fecha inicial|FechaFinal", x => x.FechaFinal);
                    isValid = false;
                }
            }

            return isValid;
        }

        private bool ValidateTipoParticipacion(Evento evento, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            var lowerCaseName = evento.TipoParticipacion.Nombre.ToLower();

            if (lowerCaseName.Contains("conferencista magistral") ||
                lowerCaseName.Contains("ponente"))
            {
                if (evento.TituloTrabajo == "")
                {
                    constraintValidatorContext.AddInvalid(
                        "no debe ser nulo, vacío o cero|TituloTrabajo", "TituloTrabajo");
                    isValid = false;
                }
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;

        }
    }
}