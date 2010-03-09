using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public interface IArticuloDifusionService
    {
        ArticuloDifusion GetArticuloById(int id);
        ArticuloDifusion[] GetAllArticulos();
        ArticuloDifusion[] GetAllArticulos(Usuario currentUser);
        ArticuloDifusion[] GetActiveArticulos();
        void SaveArticulo(ArticuloDifusion articulo);
        void SaveArticulo(ArticuloDifusion articulo, bool useCommit);
        ArticuloDifusion[] GetAllArticulos(Usuario currentUser);
    }
}