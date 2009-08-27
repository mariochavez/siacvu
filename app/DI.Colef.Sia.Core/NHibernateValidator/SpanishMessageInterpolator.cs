using System.Reflection;
using System.Resources;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    public class SpanishMessageInterpolator: IMessageInterpolator
    {
        const string ResourceName = "DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator.SpanishValidatorMessages";
        readonly ResourceManager resourceManager;

        public SpanishMessageInterpolator()
        {
            resourceManager = new ResourceManager(ResourceName, Assembly.GetExecutingAssembly());
        }

        public string Interpolate(string message, object entity, IValidator validator, IMessageInterpolator defaultInterpolator)
        {
            if (message.StartsWith("{"))
                message = message.Substring(1, message.Length - 1);

            if (message.EndsWith("}"))
                message = message.Substring(0, message.Length - 1);

            var validatorMessage = resourceManager.GetString(message) ?? message;

            return defaultInterpolator.Interpolate(validatorMessage, entity, validator, defaultInterpolator);
        }
    }
}
