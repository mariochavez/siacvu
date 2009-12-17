using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public interface IUsuarioMapper : IMapper<Usuario, UsuarioForm>
    {
        Usuario Map(UsuarioForm message, Usuario usuario);
    }
}
