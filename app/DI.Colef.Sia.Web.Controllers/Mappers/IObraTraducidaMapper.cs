using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public interface IObraTraducidaMapper : IMapper<ObraTraducida, ObraTraducidaForm>
    {
        ObraTraducida Map(ObraTraducidaForm message, Usuario usuario, Investigador investigador);

        ObraTraducida Map(ObraTraducidaForm message, Usuario usuario, Investigador investigador,
                     CoautorExternoProductoForm[] coautoresExternos, CoautorInternoProductoForm[] coautoresInternos,
                     AutorExternoProductoForm[] autoresExternos, AutorInternoProductoForm[] autoresInternos,
                     EditorialProductoForm[] editoriales);
    }
}