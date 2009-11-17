using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public interface IOrganoExternoMapper : IMapper<OrganoExterno, OrganoExternoForm>
    {
        OrganoExterno Map(OrganoExternoForm message, Usuario usuario, Investigador investigador);
    }
}