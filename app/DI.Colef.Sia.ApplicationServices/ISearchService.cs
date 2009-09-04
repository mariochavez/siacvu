using System;
using System.Linq.Expressions;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public interface ISearchService
    {
        string Search<TEntity>(Expression<Func<TEntity, object>> expression, string value);
        string SearchInvestigador(string value);
        string SearchMovilidadAcademica(string value);
        string SearchApoyoConacyt(string value);
    }
}
