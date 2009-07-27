using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class RolMapper : AutoFormMapper<Rol, RolForm>, IRolMapper
    {
        public RolMapper(IRepository<Rol> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(RolForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(RolForm message, Rol model)
        {
            model.Nombre = message.Nombre;
        }
    }
}