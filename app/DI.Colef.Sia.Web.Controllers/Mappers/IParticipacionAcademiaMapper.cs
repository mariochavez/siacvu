using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public interface IParticipacionAcademiaMapper : IMapper<ParticipacionAcademia, ParticipacionAcademiaForm>
    {
        ParticipacionAcademia Map(ParticipacionAcademiaForm message, Usuario usuario);
    }
}