using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class InvestigadorMapper : AutoFormMapper<Investigador, InvestigadorForm>, IInvestigadorMapper
    {
        public InvestigadorMapper(IRepository<Investigador> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(InvestigadorForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(InvestigadorForm message, Investigador model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
