namespace DecisionesInteligentes.Colef.Sia.Core.DataInterfaces
{
    public interface ISearchQuerying
    {
        Search[] Search<TEntity>(string fieldName, string value);
        Search[] SearchInvestigador(string value);
        Search[] SearchUsuario(string value);
        Search[] SearchMovilidadAcademica(string value);
        Search[] SearchApoyoConacyt(string value);
        Search[] SearchIdiomaInvestigador(string value);
        Search[] SearchInvestigador(string value, int investigadorId);
        Search[] SearchOrganoInterno(string value);
        Search[] SearchRevistaTipoABC(string value);
        Search[] SearchRevistaTipoD(string value);
    }
}
