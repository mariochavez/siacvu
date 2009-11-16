using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public interface IEstanciaInstitucionExternaService
    {
        EstanciaInstitucionExterna GetEstanciaInstitucionExternaById(int id);
        EstanciaInstitucionExterna[] GetAllEstanciaInstitucionExternas();
        EstanciaInstitucionExterna[] GetActiveEstanciaInstitucionExternas();
        void SaveEstanciaInstitucionExterna(EstanciaInstitucionExterna estanciaInstitucionExterna);
	    EstanciaInstitucionExterna[] GetAllEstanciaInstitucionExternas(Usuario usuario);
    }
}