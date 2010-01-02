using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(ParticipanteInternoProductoValidator))]
    public class ParticipanteInternoProductoValidatorAttribute : Attribute, IRuleArgs
    {
        public ParticipanteInternoProductoValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class ParticipanteInternoProductoValidator : IValidator
    {
        public bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var participanteInternoProducto = value as ParticipanteInternoProducto;
            if (participanteInternoProducto != null)
            {
                if (!participanteInternoProducto.ParticipanteSeOrdenaAlfabeticamente)
                {
                    if (participanteInternoProducto.Posicion <= 0)
                    {
                        constraintValidatorContext.DisableDefaultError();
                        constraintValidatorContext.AddInvalid<ParticipanteInternoProducto, int>(
                            "no debe ser menor o igual a cero|Posicion", x => x.Posicion);
                        isValid = false;
                    }
                }
            }

            return isValid;
        }
    }
}