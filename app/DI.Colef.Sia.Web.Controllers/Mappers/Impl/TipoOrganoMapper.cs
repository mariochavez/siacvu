using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class TipoOrganoMapper : AutoFormMapper<TipoOrgano, TipoOrganoForm>, ITipoOrganoMapper
    {
        public TipoOrganoMapper(IRepository<TipoOrgano> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(TipoOrganoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(TipoOrganoForm message, TipoOrgano model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
