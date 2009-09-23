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
                isValid &= !ValidateIsNullOrEmpty<Evento>(evento, x => x.TipoEvento, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Evento>(evento, x => x.Ambito, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Evento>(evento, x => x.Titulo, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Evento>(evento, x => x.TipoParticipacion, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Evento>(evento, x => x.Institucion, "InstitucionNombre",
                                                          constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Evento>(evento, x => x.Pais, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Evento>(evento, x => x.EstadoPais, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Evento>(evento, x => x.Ciudad, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Evento>(evento, x => x.TipoFinanciamiento, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Evento>(evento, x => x.LineaTematica, "LineaTematicaNombre",
                                                          constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Evento>(evento, x => x.FechaInicial, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Evento>(evento, x => x.FechaFinal, constraintValidatorContext);
            }

            isValid &= ValidateFechaInicialFinal(evento, constraintValidatorContext);

            return isValid;
        }

        bool ValidateFechaInicialFinal(Evento evento, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (evento.FechaInicial == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaInicial", "FechaInicial");
                isValid = false;
            }

            if (evento.FechaFinal == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaFinal", "FechaFinal");
                isValid = false;
            }

            if (evento.FechaInicial > DateTime.Parse("1910-01-01") || evento.FechaFinal > DateTime.Parse("1910-01-01"))
            {
                if (evento.FechaInicial < evento.PeriodoReferencia.FechaInicial ||
                    evento.FechaInicial > evento.PeriodoReferencia.FechaFinal)
                {
                    constraintValidatorContext.AddInvalid(
                        "fecha inicial debe de estar entre el periodo actual|FechaInicial", "FechaInicial");

                    isValid = false;
                }

                if (evento.FechaFinal > evento.PeriodoReferencia.FechaFinal ||
                    evento.FechaFinal < evento.PeriodoReferencia.FechaInicial)
                {
                    constraintValidatorContext.AddInvalid(
                        "fecha final debe de estar entre el periodo actual|FechaFinal", "FechaFinal");

                    isValid = false;
                }

                if (evento.FechaInicial >= evento.FechaFinal)
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