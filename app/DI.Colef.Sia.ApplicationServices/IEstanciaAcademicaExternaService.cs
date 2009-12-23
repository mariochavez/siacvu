using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public interface IEstanciaAcademicaExternaService
    {
        EstanciaAcademicaExterna GetEstanciaAcademicaExternaById(int id);
        EstanciaAcademicaExterna[] GetAllEstanciaAcademicaExternas();
        EstanciaAcademicaExterna[] GetActiveEstanciaAcademicaExternas();
        void SaveEstanciaAcademicaExterna(EstanciaAcademicaExterna estanciaAcademicaExterna);
        EstanciaAcademicaExterna[] GetAllEstanciaAcademicaExternas(Usuario usuario);
	    void SaveEstanciaAcademicaExterna(EstanciaAcademicaExterna estanciaAcademicaExterna, bool commit);
    }
}