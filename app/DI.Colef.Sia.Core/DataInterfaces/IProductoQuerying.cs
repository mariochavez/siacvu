namespace DecisionesInteligentes.Colef.Sia.Core.DataInterfaces
{
    public interface IProductoQuerying
    {
        T[] GetProductosByUsuario<T>(Usuario usuario, string coautorTableName);
    }
}