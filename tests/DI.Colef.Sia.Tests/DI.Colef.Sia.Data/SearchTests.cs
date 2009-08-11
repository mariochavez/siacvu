using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;
using Machine.Specifications;
using Rhino.Mocks;
using Tests.Extensions;

namespace Tests.DI.Colef.Sia.Data
{
    [Subject("Search")]
    public class when_passing_an_expression
    {
        protected static ISearchService searchService;
        protected static ISearchQuerying searchQuerying;

        Establish context = () =>
            {
                searchQuerying = MockRepository.GenerateMock<ISearchQuerying>();
                searchQuerying.Expect(x => x.Search<Rol>("Nombre", "nombre"))
                    .Return(new[] { new Search { Id = 1, Nombre = "Valor 1" }, new Search { Id = 2, Nombre = "Valor 2" } });
            };

        Because of = () =>
            {
                searchService = new SearchService(searchQuerying);
            };

        It should_pass_Nombre_as_the_field_to_query = () =>
            {
                searchService.Search<Rol>(i => i.Nombre, "nombre");
                searchQuerying.VerifyAllExpectations();
            };
    }

    [Subject("Search")]
    public class when_searching_by_investigador
    {
        protected static ISearchService searchService;
        protected static ISearchQuerying searchQuerying;

        Establish context = () =>
            {
                searchQuerying = MockRepository.GenerateMock<ISearchQuerying>();
                searchQuerying.Expect(x => x.SearchInvestigador("nombre"))
                    .Return(new[] {new Search {Id = 1, Nombre = "Valor 1"}, new Search {Id = 2, Nombre = "Valor 2"}});
            };

        Because of = () =>
            {
                searchService = new SearchService(searchQuerying);
            };

        It should_pass_Nombre_as_the_field_to_query = () =>
            {
                searchService.SearchInvestigador("nombre");
                searchQuerying.VerifyAllExpectations();
            };
    }

    [Subject("Search")]
    public class when_searching_by_investigador_in_database : ConnectionSetup
    {
        protected static ISearchService searchService;
        protected static ISearchQuerying searchQuerying;

        Because of = () =>
        {
            searchQuerying = new SearchQuerying();
            searchService = new SearchService(searchQuerying);
        };

        It should_return_Administrador_in_search_object = () =>
        {
            var result = searchService.SearchInvestigador("Administrador");
            result.ShouldEqual("Administrador|1\n");
        };
    }

    [Subject("Search")]
    public class when_searching_by_sede_in_database : ConnectionSetup
    {
        protected static ISearchService searchService;
        protected static ISearchQuerying searchQuerying;

        Because of = () =>
        {
            searchQuerying = new SearchQuerying();
            searchService = new SearchService(searchQuerying);
        };

        It should_return_Administrador_in_search_object = () =>
        {
            var result = searchService.Search<Sede>(s => s.Nombre, "Tijuana");
            result.ShouldEqual("Tijuana|6\n");
        };
    }
}
