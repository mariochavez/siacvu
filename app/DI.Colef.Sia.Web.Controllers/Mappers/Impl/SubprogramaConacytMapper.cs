using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class SubprogramaConacytMapper : AutoFormMapper<SubprogramaConacyt, SubprogramaConacytForm>, ISubprogramaConacytMapper
    {
        public SubprogramaConacytMapper(IRepository<SubprogramaConacyt> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(SubprogramaConacytForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(SubprogramaConacytForm message, SubprogramaConacyt model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
