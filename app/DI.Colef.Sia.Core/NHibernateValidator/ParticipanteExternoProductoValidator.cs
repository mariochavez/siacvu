using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(ParticipanteExternoProductoValidator))]
    public class ParticipanteExternoProductoValidatorAttribute : Attribute, IRuleArgs
    {
        public ParticipanteExternoProductoValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class ParticipanteExternoProductoValidator : IValidator
    {
        public bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var participanteExternoProducto = value as ParticipanteExternoProducto;
            if (participanteExternoProducto != null)
            {
                if (!participanteExternoProducto.ParticipanteSeOrdenaAlfabeticamente)
                {
                    if (participanteExternoProducto.Posicion <= 0)
                    {
                        constraintValidatorContext.DisableDefaultError();
                        constraintValidatorContext.AddInvalid<ParticipanteExternoProducto, int>(
                            "no debe ser menor o igual a cero|Posicion", x => x.Posicion);
                        isValid = false;
                    }
                }
            }

            return isValid;
        }
    }
}