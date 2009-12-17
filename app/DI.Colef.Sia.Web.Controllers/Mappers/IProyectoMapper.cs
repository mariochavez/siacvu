using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{

    public interface IProyectoMapper : IMapper<Proyecto, ProyectoForm>
    {
        Proyecto Map(ProyectoForm message, Usuario usuario, Investigador investigador);

        Proyecto Map(ProyectoForm message, Usuario usuario, Investigador investigador,
                     ResponsableProyectoForm[] responsables,
                     ParticipanteInternoProductoForm[] participantesInternos,
                     ParticipanteExternoProductoForm[] participantesExternos,
                     RecursoFinancieroProyectoForm[] recursos,
                     EstudianteProyectoForm[] estudiantes,
                     ProductoGeneradoProyectoForm[] productos);

        Proyecto Map(ProyectoForm message, Usuario usuario);
    }
}