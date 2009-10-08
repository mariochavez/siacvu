using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public interface IDictamenMapper : IMapper<Dictamen, DictamenForm>
    {
        Dictamen Map(DictamenForm message, Usuario usuario, PeriodoReferencia periodo, Investigador investigador);
    }
}
