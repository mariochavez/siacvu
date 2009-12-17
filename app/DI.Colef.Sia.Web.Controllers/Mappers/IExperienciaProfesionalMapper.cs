using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public interface IExperienciaProfesionalMapper : IMapper<ExperienciaProfesional, ExperienciaProfesionalForm>
    {
        ExperienciaProfesional Map(ExperienciaProfesionalForm message, Usuario usuario);
    }
}