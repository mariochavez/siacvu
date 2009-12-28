using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public interface IProductoService
    {
        object[] GetProductosBandeja(Usuario usuario);
        string SignAndGetNombreProducto(int id, int tipoProducto, Usuario usuario);
        object[] GetProductosBandeja(bool isDgaa);
        object[] GetProductosBandeja(bool isDgaa, int filterId, int filterType);
    }
}