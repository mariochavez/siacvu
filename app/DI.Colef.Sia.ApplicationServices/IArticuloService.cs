using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public interface IArticuloService
    {
        Articulo GetArticuloById(int id);
        Articulo[] GetAllArticulos();
        Articulo[] GetActiveArticulos();
        void SaveArticulo(Articulo articulo);
        Articulo[] GetAllArticulos(Usuario usuario);
        void SaveArticulo(Articulo articulo, bool useCommit);
    }
}
