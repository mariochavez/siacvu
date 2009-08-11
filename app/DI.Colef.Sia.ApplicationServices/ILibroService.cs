using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public interface ILibroService
    {
        Libro GetLibroById(int id);
        Libro[] GetAllLibros();
        Libro[] GetActiveLibros();
        void SaveLibro(Libro libro);
    }
}
