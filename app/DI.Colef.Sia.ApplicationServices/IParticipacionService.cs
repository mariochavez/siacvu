using System;
using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public interface IParticipacionService
    {
        Participacion GetParticipacionById(int id);
        Participacion[] GetAllParticipacions();
        Participacion[] GetActiveParticipacions();
        void SaveParticipacion(Participacion participacion);
    }
}
