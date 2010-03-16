
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class GlosarioMapper : AutoFormMapper<Glosario, GlosarioForm>, IGlosarioMapper
    {
        public GlosarioMapper(IRepository<Glosario> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(GlosarioForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(GlosarioForm message, Glosario model)
        {
            model.Campo = message.Campo;
            model.Descripcion = message.Descripcion;
            model.Contexto = message.Contexto;
        }
    }
}
