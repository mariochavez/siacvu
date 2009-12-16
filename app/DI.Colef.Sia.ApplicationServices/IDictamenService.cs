using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public interface IDictamenService
    {
        Dictamen GetDictamenById(int id);
        Dictamen[] GetAllDictamenes();
        Dictamen[] GetActiveDictamenes();
        void SaveDictamen(Dictamen dictamen);
        void SaveDictamen(Dictamen dictamen, bool commit);
	    Dictamen[] GetAllDictamenes(Usuario usuario);
    }
}
