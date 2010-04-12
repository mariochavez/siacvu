using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public interface IProductoService
    {
        object[] GetProductosPendientesBandeja(Usuario usuario);
        object[] GetProductosFinalizadosBandeja(Usuario usuario);

        string SignAndGetNombreProducto(int id, int tipoProducto, Usuario usuario);
        object[] GetProductosBandeja(bool isDgaa);
        object[] GetProductosBandeja(bool isDgaa, int filterId, int filterType);

        decimal GetPuntosSieva(Usuario usuario);
    }
}