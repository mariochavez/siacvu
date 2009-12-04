using DecisionesInteligentes.Colef.Sia.Data.NHibernateMaps;
using Machine.Specifications;
using SharpArch.Data.NHibernate;
using SharpArch.Testing.NHibernate;

namespace Tests.DI.Colef.Sia.Data
{
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