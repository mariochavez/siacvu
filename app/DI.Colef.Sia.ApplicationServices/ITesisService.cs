using System;
using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public interface ITesisService
    {
        Tesis GetTesisById(int id);
        Tesis[] GetAllTesis();
        Tesis[] GetActiveTesis();
        void SaveTesis(Tesis tesis);
    }
}
