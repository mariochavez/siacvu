using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public interface IProductoService
    {
        object[] GetProductosBandeja(Usuario usuario);
        string SignAndGetNombreProducto(int id, int tipoProducto, Usuario usuario);
        object[] GetProductosBandeja(bool isDgaa);
    }
}