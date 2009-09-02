using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{

    public interface IProyectoMapper : IMapper<Proyecto, ProyectoForm>
    {
        Proyecto Map(ProyectoForm message, Usuario usuario);

        Proyecto Map(ProyectoForm message, Usuario usuario, string[] participantesExternos,
                     string[] participantesInternos, string[] responsablesExternos, string[] responsablesInternos,
                     string[] institucionRecursoFinanciero, string[] monedaRecursoFinanciero, string[] montoRecursoFinanciero,
                     string[] recursoRecursoFinanciero);
    }
}