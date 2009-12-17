using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public interface IInvestigadorService
    {
        Investigador GetInvestigadorById(int id);
        Investigador[] GetAllInvestigadores();
        Investigador[] GetActiveInvestigadores();
        void SaveInvestigador(Investigador investigador);
        void SaveInvestigador(Investigador investigador, bool commit);

        // Querying
        Usuario[] FindUsuariosToBeInvestigador();
        Investigador GetInvestigadorByUsuario(string usuarioNombre);
    }
}
