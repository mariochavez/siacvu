using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public interface IEstanciaAcademicaExternaMapper : IMapper<EstanciaAcademicaExterna, EstanciaAcademicaExternaForm>
    {
        EstanciaAcademicaExterna Map(EstanciaAcademicaExternaForm message, Usuario usuario, Investigador investigador);
    }
}