using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{

    public interface IReseñaMapper : IMapper<Reseña, ReseñaForm>
    {
        Reseña Map(ReseñaForm message, Usuario usuario, Investigador investigador);
    }
}
