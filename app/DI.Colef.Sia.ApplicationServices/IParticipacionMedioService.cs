using System;
using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public interface IParticipacionMedioService
    {
        ParticipacionMedio GetParticipacionMedioById(int id);
        ParticipacionMedio[] GetAllParticipacionMedios();
        ParticipacionMedio[] GetActiveParticipacionMedios();
        void SaveParticipacionMedio(ParticipacionMedio participacionMedio);
    }
}
