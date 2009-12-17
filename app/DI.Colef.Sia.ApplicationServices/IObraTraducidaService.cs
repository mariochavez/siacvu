using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public interface IObraTraducidaService
    {
        ObraTraducida GetObraTraducidaById(int id);
        ObraTraducida[] GetAllObraTraducidas();
        ObraTraducida[] GetActiveObraTraducidas();
        void SaveObraTraducida(ObraTraducida obraTraducida);
        void SaveObraTraducida(ObraTraducida obraTraducida, bool commit);
        ObraTraducida[] GetAllObraTraducidas(Usuario usuario);
    }
}