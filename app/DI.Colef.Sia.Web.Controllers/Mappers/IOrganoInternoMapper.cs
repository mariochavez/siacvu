using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public interface IOrganoInternoMapper : IMapper<OrganoInterno, OrganoInternoForm>
    {
        OrganoInterno Map(OrganoInternoForm message, Usuario usuario);
    }
}