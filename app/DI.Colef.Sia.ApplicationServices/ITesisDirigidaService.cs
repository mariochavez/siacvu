using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public interface ITesisDirigidaService
    {
        TesisDirigida GetTesisDirigidaById(int id);
        TesisDirigida[] GetAllTesisDirigidas();
        TesisDirigida[] GetActiveTesisDirigidas();
        void SaveTesisDirigida(TesisDirigida tesisDirigida);
        void SaveTesisDirigida(TesisDirigida tesisDirigida, bool commit);
	    TesisDirigida[] GetAllTesisDirigidas(Usuario usuario);
    }
}
