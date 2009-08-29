using System;
using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public interface IGrupoInvestigacionService
    {
        GrupoInvestigacion GetGrupoInvestigacionById(int id);
        GrupoInvestigacion[] GetAllGrupoInvestigacions();
        GrupoInvestigacion[] GetActiveGrupoInvestigacions();
        void SaveGrupoInvestigacion(GrupoInvestigacion grupoInvestigacion);
    }
}
