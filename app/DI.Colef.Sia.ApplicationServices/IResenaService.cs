using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public interface IResenaService
    {
        Resena GetResenaById(int id);
        Resena[] GetAllResenas();
        Resena[] GetActiveResenas();
        void SaveResena(Resena resena);
	    Resena[] GetAllResenas(Usuario usuario);
    }
}
