using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class ImpactoPoliticaPublicaMapper : AutoFormMapper<ImpactoPoliticaPublica, ImpactoPoliticaPublicaForm>, IImpactoPoliticaPublicaMapper
    {
        public ImpactoPoliticaPublicaMapper(IRepository<ImpactoPoliticaPublica> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(ImpactoPoliticaPublicaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ImpactoPoliticaPublicaForm message, ImpactoPoliticaPublica model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
