using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public interface IResenaService
    {
        Resena GetResenaById(int id);
        Resena[] GetAllResenas();
        Resena[] GetActiveResenas();
        void SaveResena(Resena resena);
        void SaveResena(Resena resena, bool commit);
	    Resena[] GetAllResenas(Usuario usuario);
    }
}