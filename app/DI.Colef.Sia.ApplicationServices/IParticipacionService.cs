using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public interface IParticipacionService
    {
        Participacion GetParticipacionById(int id);
        Participacion[] GetAllParticipaciones();
        Participacion[] GetActiveParticipaciones();
        void SaveParticipacion(Participacion participacion);
	    Participacion[] GetAllParticipaciones(Usuario usuario);
    }
}
