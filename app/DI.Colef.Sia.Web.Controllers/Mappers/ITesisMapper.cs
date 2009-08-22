using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{

    public interface ITesisMapper : IMapper<Tesis, TesisForm>
    {
        Tesis Map(TesisForm message, Usuario usuario, Investigador investigador, PeriodoReferencia periodo);
    }
}
