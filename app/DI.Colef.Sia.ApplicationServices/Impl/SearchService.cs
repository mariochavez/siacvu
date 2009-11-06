using System;
using System.Linq.Expressions;
using System.Reflection;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public class SearchService : ISearchService
    {
        readonly ISearchQuerying searchQuerying;

        public SearchService(ISearchQuerying searchQuerying)
        {
            this.searchQuerying = searchQuerying;
        }

        public string Search<TEntity>(Expression<Func<TEntity, object>> expression, string value)
        {
            PropertyInfo propertyInfo = ReflectionHelper.GetProperty(expression);

            var results = searchQuerying.Search<TEntity>(propertyInfo.Name, value);
            return ParseResult(results);
        }

        public string SearchInvestigador(string value)
        {
            var results = searchQuerying.SearchInvestigador(value);
            return ParseResult(results);
        }

        public string SearchInvestigador(string value, Investigador investigador)
        {
            var results = searchQuerying.SearchInvestigador(value, investigador);
            return ParseResult(results);
        }

        public string SearchMovilidadAcademica(string value)
        {
            var results = searchQuerying.SearchMovilidadAcademica(value);
            return ParseResult(results);
        }

        public string SearchApoyoConacyt(string value)
        {
            var results = searchQuerying.SearchApoyoConacyt(value);
            return ParseResult(results);
        }

        public string SearchIdiomaInvestigador(string value)
        {
            var results = searchQuerying.SearchIdiomaInvestigador(value);
            return ParseResult(results);
        }

        string ParseResult(Search[] results)
        {
            if (results == null)
                return null;

            var result = String.Empty;
            foreach (var record in results)
            {
                result += String.Format("{0}|{1}\n", record.Nombre, record.Id);
            }
            return result;
        }
    }
}