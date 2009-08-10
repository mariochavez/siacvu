using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{

    public interface IDistincionMapper : IMapper<Distincion, DistincionForm>
    {
        Distincion Map(DistincionForm message, Usuario usuario, Investigador investigador);
    }
}
