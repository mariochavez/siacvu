using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public interface IArticuloMapper : IMapper<Articulo, ArticuloForm>
    {
        Articulo Map(ArticuloForm message, Usuario usuario, PeriodoReferencia periodo, Investigador investigador);
        Articulo Map(ArticuloForm message, Usuario usuario, PeriodoReferencia periodo, Investigador investigador,
            CoautorExternoProductoForm[] coautoresExternos, CoautorInternoProductoForm[] coautoresInternos);
    }
}
