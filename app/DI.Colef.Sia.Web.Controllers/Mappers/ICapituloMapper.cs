using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public interface ICapituloMapper : IMapper<Capitulo, CapituloForm>
    {
        Capitulo Map(CapituloForm message, Usuario usuario, Investigador investigador, PeriodoReferencia periodo);
        Capitulo Map(CapituloForm message, Usuario usuario, Investigador investigador, PeriodoReferencia periodo,
            string[] coautoresExternos, string[] coautoresInternos,
            string[] responsablesExternos, string[] responsablesInternos);
    }
}
