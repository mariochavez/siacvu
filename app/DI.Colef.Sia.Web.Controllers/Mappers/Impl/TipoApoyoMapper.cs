using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class TipoApoyoMapper : AutoFormMapper<TipoApoyo, TipoApoyoForm>, ITipoApoyoMapper
    {
        public TipoApoyoMapper(IRepository<TipoApoyo> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(TipoApoyoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(TipoApoyoForm message, TipoApoyo model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
