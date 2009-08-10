using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class DependenciaMapper : AutoFormMapper<Dependencia, DependenciaForm>, IDependenciaMapper
    {
        public DependenciaMapper(IRepository<Dependencia> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(DependenciaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(DependenciaForm message, Dependencia model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
