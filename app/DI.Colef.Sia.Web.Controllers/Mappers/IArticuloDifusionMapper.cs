using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public interface IArticuloDifusionMapper : IMapper<ArticuloDifusion, ArticuloDifusionForm>
    {
        ArticuloDifusion Map(ArticuloDifusionForm message, Usuario usuario, Investigador investigador);

        ArticuloDifusion Map(ArticuloDifusionForm message, Usuario usuario, Investigador investigador,
                             CoautorExternoProductoForm[] coautoresExternos,
                             CoautorInternoProductoForm[] coautoresInternos);

        ArticuloDifusion Map(ArticuloDifusionForm message, Usuario usuario);
    }
}