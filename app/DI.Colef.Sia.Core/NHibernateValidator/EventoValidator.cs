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
        public override void Initialize(EventoValidatorAttribute parameters)
        {
        }

        public override bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var evento = value as Evento;

            if (!evento.IsTransient())
            {

            }

            if(evento.TipoParticipacion != null)
                isValid &= ValidateTipoParticipacion(evento, constraintValidatorContext);

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