using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public interface IEventoService
    {
        Evento GetEventoById(int id);
        Evento[] GetAllEventos();
        Evento[] GetActiveEventos();
        void SaveEvento(Evento evento);
    }
}
