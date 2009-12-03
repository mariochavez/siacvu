using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public interface ICursoInvestigadorService
    {
        CursoInvestigador GetCursoInvestigadorById(int id);
        CursoInvestigador[] GetAllCursosInvestigador();
        CursoInvestigador[] FindUnsedCursosInvestigador(Investigador investigador);
    }
}