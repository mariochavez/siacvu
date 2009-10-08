using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public interface IParticipacionMedioMapper : IMapper<ParticipacionMedio, ParticipacionMedioForm>
    {
        ParticipacionMedio Map(ParticipacionMedioForm message, Usuario usuario, PeriodoReferencia periodo, Investigador investigador);
    }
}
