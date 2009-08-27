using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public interface ICursoMapper : IMapper<Curso, CursoForm>
    {
        Curso Map(CursoForm message, Usuario usuario, PeriodoReferencia periodo);
    }
}
