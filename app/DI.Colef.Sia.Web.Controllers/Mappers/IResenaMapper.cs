using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{

    public interface IResenaMapper : IMapper<Resena, ResenaForm>
    {
        Resena Map(ResenaForm message, Usuario usuario, Investigador investigador, PeriodoReferencia periodo);

        Resena Map(ResenaForm message, Usuario usuario, Investigador investigador, PeriodoReferencia periodo,
                   string[] coautoresExternos, string[] coautoresInternos);
    }
}
