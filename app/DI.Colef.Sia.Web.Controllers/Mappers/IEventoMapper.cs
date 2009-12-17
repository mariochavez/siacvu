using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public interface IEventoMapper : IMapper<Evento, EventoForm>
    {
        Evento Map(EventoForm message, Usuario usuario, Investigador investigador);
        Evento Map(EventoForm message, Usuario usuario);
        Evento Map(EventoForm message, Usuario usuario, Investigador investigador,
                   CoautorExternoProductoForm[] coautoresExternos, CoautorInternoProductoForm[] coautoresInternos, 
                   InstitucionProductoForm[] instituciones, SesionEventoForm[] sesiones);
    }
}
