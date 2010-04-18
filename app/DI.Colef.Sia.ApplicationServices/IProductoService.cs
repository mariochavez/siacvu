using System;
using System.Linq.Expressions;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public interface IProductoService
    {
        object[] GetProductosPendientesBandeja(Usuario usuario);
        object[] GetProductosFinalizadosBandeja(Usuario usuario);

        ProductoDTO[] GetProductosByUsuario<T>(Usuario usuario, Expression<Func<T, object>> productName,
                                               Expression<Func<T, object>> productType);

        string SignAndGetNombreProducto(int id, int tipoProducto, Usuario usuario);
        object[] GetProductosBandeja(bool isDgaa);
        object[] GetProductosBandeja(bool isDgaa, int filterId, int filterType);

        decimal GetPuntosSieva(Usuario usuario);
    }
}