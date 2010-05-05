using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public interface IGrupoInvestigacionMapper : IMapper<GrupoInvestigacion, GrupoInvestigacionForm>
    {
        GrupoInvestigacion Map(GrupoInvestigacionForm message, Usuario usuario, Investigador investigador);
        GrupoInvestigacion Map(GrupoInvestigacionForm message, Usuario usuario);
        GrupoInvestigacion Map(GrupoInvestigacionForm message, Usuario usuario, Investigador investigador,
            CoautorExternoProductoForm[] miembrosExternos, CoautorInternoProductoForm[] miembrosInternos);
    }
}