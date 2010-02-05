using System;

namespace DecisionesInteligentes.Colef.Sia.Core.DataInterfaces
{
    public interface IProductoQuerying
    {
        T[] GetProductosByUsuario<T>(Usuario usuario, string coautorTableName);
        object[] GetBandejaProductos(Usuario usuario, TipoBandeja tipoBandeja);
        object[] GetBandejaProductos(bool isDgaa);
        object[] GetBandejaProductos(bool isDgaa, int filterId, int filterType);
    }
}