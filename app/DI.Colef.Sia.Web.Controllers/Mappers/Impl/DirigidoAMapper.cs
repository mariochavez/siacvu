using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class DirigidoAMapper : AutoFormMapper<DirigidoA, DirigidoAForm>, IDirigidoAMapper
    {
        public DirigidoAMapper(IRepository<DirigidoA> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(DirigidoAForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(DirigidoAForm message, DirigidoA model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
