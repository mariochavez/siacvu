using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class TipoParticipanteMapper : AutoFormMapper<TipoParticipante, TipoParticipanteForm>, ITipoParticipanteMapper
    {
        public TipoParticipanteMapper(IRepository<TipoParticipante> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(TipoParticipanteForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(TipoParticipanteForm message, TipoParticipante model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
