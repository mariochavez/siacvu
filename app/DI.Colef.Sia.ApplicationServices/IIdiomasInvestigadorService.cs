using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public interface IIdiomasInvestigadorService
    {
        IdiomasInvestigador GetIdiomasInvestigadorById(int id);
        IdiomasInvestigador[] GetAllIdiomasInvestigadores();
        IdiomasInvestigador[] GetActiveIdiomasInvestigadores();
        void SaveIdiomasInvestigador(IdiomasInvestigador idiomasInvestigador);
	    IdiomasInvestigador[] GetAllIdiomasInvestigadores(Usuario usuario);
    }
}
