using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public interface IApoyoConacytService
    {
        ApoyoConacyt GetApoyoConacytById(int id);
        ApoyoConacyt[] GetAllApoyosConacyt();
        ApoyoConacyt[] GetActiveApoyosConacyt();
        void SaveApoyoConacyt(ApoyoConacyt apoyoConacyt);
	    ApoyoConacyt[] GetAllApoyosConacyt(Usuario usuario);
    }
}
