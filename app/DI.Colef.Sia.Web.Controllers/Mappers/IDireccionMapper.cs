using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public interface IDireccionMapper : IMapper<Direccion, DireccionForm>
    {
        Direccion Map(DireccionForm message, Usuario usuario);
    }
}
