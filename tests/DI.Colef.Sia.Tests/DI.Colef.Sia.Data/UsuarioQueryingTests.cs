using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;
using DecisionesInteligentes.Colef.Sia.Data.NHibernateMaps;
using Machine.Specifications;
using SharpArch.Data.NHibernate;
using SharpArch.Testing.NHibernate;
using Tests.Extensions;

namespace Tests.DI.Colef.Sia.Data
{
    [Subject(typeof(UsuarioQuerying))]
    public class UsuarioQueryingTests : ConnectionSetup
    {
        static IUsuarioQuerying usuarioQuerying;
        static Usuario[] usuarios;

        Because of = () =>
            {
                usuarioQuerying = new UsuarioQuerying();
                usuarios = usuarioQuerying.FindUsuariosToBeInvestigador();
            };

        It should_found_one_user = () =>
            {
                usuarios.ShouldNotBeEmpty();
                usuarios.Length.ShouldEqual(1);
            };
    }

    [Subject(typeof(InvestigadorQuerying))]
    public class InvestigadorQueryingTests : ConnectionSetup
    {
        static IInvestigadorQuerying investigadorQuerying;
        static Investigador[] investigadores;

        Because of = () =>
        {
            investigadorQuerying = new InvestigadorQuerying();
            //investigadores = investigadorQuerying.FindUsuariosToBeInvestigador();
        };

        It should_found_one_user = () =>
        {
            investigadores.ShouldNotBeEmpty();
            investigadores.Length.ShouldBeGreaterThan(1);
        };
    }

    [Subject("ConnectionSetup")]
    public class ConnectionSetup
    {
        const string LIVE_DB_CONFIG_PATH = "../../../../app/DI.Colef.Sia.Web/NHibernate.config";

        static string factoryKey = "nhibernate.tests_using_live_database";

        Establish context = () =>
            {
                NHibernateSession.SessionFactory = null;
                NHibernateSession.Storage = null;

                string[] mappingAssemblies = RepositoryTestsHelper.GetMappingAssemblies();
                NHibernateSession.Init(new SimpleSessionStorage(), mappingAssemblies,
                    new AutoPersistenceModelGenerator().Generate(), LIVE_DB_CONFIG_PATH);
            };
    }
}
