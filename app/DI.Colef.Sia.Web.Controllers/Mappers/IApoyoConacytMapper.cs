using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{

    public interface IApoyoConacytMapper : IMapper<ApoyoConacyt, ApoyoConacytForm>
    {
        ApoyoConacyt Map(ApoyoConacytForm message, Usuario usuario);
    }
}
