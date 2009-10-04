using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public interface ICapituloMapper : IMapper<Capitulo, CapituloForm>
    {
        Capitulo Map(CapituloForm message, Usuario usuario, PeriodoReferencia periodo);
        Capitulo Map(CapituloForm message, Usuario usuario, PeriodoReferencia periodo,
            string[] coautoresExternos, CoautorInternoProductoForm[] coautoresInternos,
            string[] responsablesExternos, string[] responsablesInternos);
    }
}
