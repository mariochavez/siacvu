using System;
using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public interface IDistincionService
    {
        Distincion GetDistincionById(int id);
        Distincion[] GetAllDistinciones();
        Distincion[] GetActiveDistinciones();
        void SaveDistincion(Distincion distincion);
    }
}
