using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public interface IEstanciaInstitucionExternaMapper : IMapper<EstanciaInstitucionExterna, EstanciaInstitucionExternaForm>
    {
        EstanciaInstitucionExterna Map(EstanciaInstitucionExternaForm message, Usuario usuario);
    }
}
