using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public interface IInvestigadorService
    {
        Investigador GetInvestigadorById(int id);
        Investigador[] GetAllInvestigadors();
        Investigador[] GetActiveInvestigadorInternos();
        void SaveInvestigador(Investigador investigador);

        // Querying
        Usuario[] FindUsuariosToBeInvestigador();
    }
}
