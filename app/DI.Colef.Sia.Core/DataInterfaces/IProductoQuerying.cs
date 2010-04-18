using System;
using System.Linq.Expressions;

namespace DecisionesInteligentes.Colef.Sia.Core.DataInterfaces
{
    public interface IProductoQuerying
    {
        T[] GetProductosByUsuario<T>(Usuario usuario, string coautorTableName);
        ProductoDTO[] GetProductosByUsuario<T>(Usuario usuario, Expression<Func<T, object>> productName,
            Expression<Func<T, object>> productType);
        object[] GetBandejaProductos(Usuario usuario, TipoBandeja tipoBandeja);
        object[] GetBandejaProductos(bool isDgaa);
        object[] GetBandejaProductos(bool isDgaa, int filterId, int filterType);
        decimal GetPuntosSieva(Usuario usuario);
    }
}