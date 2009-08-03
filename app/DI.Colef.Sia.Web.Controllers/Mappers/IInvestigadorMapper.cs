using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{

    public interface IInvestigadorMapper : IMapper<Investigador, InvestigadorForm>
    {
        Investigador Map(InvestigadorForm message, Usuario usuario);
    }
}
