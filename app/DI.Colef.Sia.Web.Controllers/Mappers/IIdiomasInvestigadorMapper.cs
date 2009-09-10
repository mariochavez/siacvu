using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{

    public interface IIdiomasInvestigadorMapper : IMapper<IdiomasInvestigador, IdiomasInvestigadorForm>
    {
        IdiomasInvestigador Map(IdiomasInvestigadorForm message, Usuario usuario);
    }
}
