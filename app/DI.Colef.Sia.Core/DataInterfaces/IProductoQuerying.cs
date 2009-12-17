using System;

namespace DecisionesInteligentes.Colef.Sia.Core.DataInterfaces
{
    public interface IProductoQuerying
    {
        T[] GetProductosByUsuario<T>(Usuario usuario, string coautorTableName);
        object[] GetProductosBandeja(Usuario usuario);
        object[] GetProductosBandeja(bool isDgaa);
    }
}