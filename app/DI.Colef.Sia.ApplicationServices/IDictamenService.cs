using System;
using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public interface IDictamenService
    {
        Dictamen GetDictamenById(int id);
        Dictamen[] GetAllDictamens();
        Dictamen[] GetActiveDictamens();
        void SaveDictamen(Dictamen dictamen);
    }
}
