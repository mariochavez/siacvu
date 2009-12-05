using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public interface IObraTraducidaService
    {
        ObraTraducida GetObraTraducidaById(int id);
        ObraTraducida[] GetAllObraTraducidas();
        ObraTraducida[] GetActiveObraTraducidas();
        void SaveObraTraducida(ObraTraducida obraTraducida);
        ObraTraducida[] GetAllObraTraducidas(Usuario usuario);
    }
}
