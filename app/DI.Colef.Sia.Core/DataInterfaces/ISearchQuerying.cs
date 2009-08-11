namespace DecisionesInteligentes.Colef.Sia.Core.DataInterfaces
{
    public interface ISearchQuerying
    {
        Search[] Search<TEntity>(string fieldName, string value);
        Search[] SearchInvestigador(string value);
        Search[] SearchMovilidadAcademica(string value);
    }
}
