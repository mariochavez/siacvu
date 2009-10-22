using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public interface IParticipacionMapper : IMapper<Participacion, ParticipacionForm>
    {
        Participacion Map(ParticipacionForm message, Usuario usuario, Investigador investigador);
    }
}
