using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class DepartamentoMapper : AutoFormMapper<Departamento, DepartamentoForm>, IDepartamentoMapper
    {
        public DepartamentoMapper(IRepository<Departamento> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(DepartamentoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(DepartamentoForm message, Departamento model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
