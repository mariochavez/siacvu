using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public interface IProductoService
    {
        object[] GetProductosBandeja(Usuario usuario);
    }
}