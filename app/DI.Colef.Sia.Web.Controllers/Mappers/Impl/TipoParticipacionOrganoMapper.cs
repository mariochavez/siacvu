using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class TipoParticipacionOrganoMapper : AutoFormMapper<TipoParticipacionOrgano, TipoParticipacionOrganoForm>, ITipoParticipacionOrganoMapper
    {
        public TipoParticipacionOrganoMapper(IRepository<TipoParticipacionOrgano> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(TipoParticipacionOrganoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(TipoParticipacionOrganoForm message, TipoParticipacionOrgano model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
