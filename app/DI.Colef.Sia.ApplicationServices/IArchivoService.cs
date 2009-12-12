using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public interface IArchivoService
    {
        void Save(Archivo archivo);
        Archivo GetArchivoById(int id);
    }
}
