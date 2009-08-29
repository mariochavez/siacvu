using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public interface IFormacionAcademicaMapper : IMapper<FormacionAcademica, FormacionAcademicaForm>
    {
        FormacionAcademica Map(FormacionAcademicaForm message, Usuario usuario);
    }
}
