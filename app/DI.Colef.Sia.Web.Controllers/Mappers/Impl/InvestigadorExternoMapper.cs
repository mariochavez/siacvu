using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class InvestigadorExternoMapper : AutoFormMapper<InvestigadorExterno, InvestigadorExternoForm>, IInvestigadorExternoMapper
    {
        public InvestigadorExternoMapper(IRepository<InvestigadorExterno> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(InvestigadorExternoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(InvestigadorExternoForm message, InvestigadorExterno model)
        {
            model.Nombre = message.Nombre;
            model.ApellidoPaterno = message.ApellidoPaterno;
            model.ApellidoMaterno = message.ApellidoMaterno;
        }
    }
}
