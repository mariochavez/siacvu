using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public interface ICurriculumService
    {
        object [] GetListaProductos(Usuario usuario);
    }
}
