using System;
using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public interface IInvestigadorService
    {
        Investigador GetInvestigadorById(int id);
        Investigador[] GetAllInvestigadors();
        void SaveInvestigador(Investigador investigador);
    }
}
