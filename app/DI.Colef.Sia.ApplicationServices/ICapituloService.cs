using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public interface ICapituloService
    {
        Capitulo GetCapituloById(int id);
        Capitulo[] GetAllCapitulos();
        Capitulo[] GetActiveCapitulos();
        void SaveCapitulo(Capitulo capitulo);
        void SaveCapitulo(Capitulo capitulo, bool commit);
	    Capitulo[] GetAllCapitulos(Usuario usuario);
    }
}