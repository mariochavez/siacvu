using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class DiplomadoMapper : AutoFormMapper<Diplomado, DiplomadoForm>, IDiplomadoMapper
    {
        public DiplomadoMapper(IRepository<Diplomado> repository) : base(repository)
        {

        }

        protected override int GetIdFromMessage(DiplomadoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(DiplomadoForm message, Diplomado model)
        {
			model.Nombre = message.Nombre;
        }
    }
}