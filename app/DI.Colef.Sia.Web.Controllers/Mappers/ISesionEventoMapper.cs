using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public interface ISesionEventoMapper : IMapper<SesionEvento, SesionEventoForm>
    {
        SesionEvento Map(SesionEventoForm message, Usuario usuario, Investigador investigador);
        SesionEvento Map(SesionEventoForm message, Usuario usuario, Investigador investigador,
            ParticipanteExternoProductoForm[] participantesExternos, ParticipanteInternoProductoForm[] participantesInternos);
    }
}