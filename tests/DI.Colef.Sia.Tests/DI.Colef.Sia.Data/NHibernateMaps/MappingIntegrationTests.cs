using System.IO;
using DecisionesInteligentes.Colef.Sia.Data.NHibernateMaps;
using NHibernate.Cfg;
using NHibernate.Tool.hbm2ddl;
using NUnit.Framework;
using SharpArch.Data.NHibernate;
using System.Collections.Generic;
using NHibernate;
using NHibernate.Metadata;
using SharpArch.Testing.NHibernate;

namespace Tests.DI.Colef.Sia.Data.NHibernateMaps
{
    /// <summary>
    /// Provides a means to verify that the target database is in compliance with all mappings.
    /// Taken from http://ayende.com/Blog/archive/2006/08/09/NHibernateMappingCreatingSanityChecks.aspx.
    /// 
    /// If this is failing, the error will likely inform you that there is a missing table or column
    /// which needs to be added to your database.
    /// </summary>
    [TestFixture]
    [Category("DB Tests")]
    public class MappingIntegrationTests
    {
        [SetUp]
        public virtual void SetUp()
        {
            NHibernateSession.SessionFactory = null;
            NHibernateSession.Storage = null;

            string[] mappingAssemblies = RepositoryTestsHelper.GetMappingAssemblies();
            NHibernateSession.Init(new SimpleSessionStorage(factoryKey), mappingAssemblies,
                new AutoPersistenceModelGenerator().Generate(), LIVE_DB_CONFIG_PATH, LIVE_VAL_CONFIG_PATH);
        }

        [Test]
        public void CanConfirmDatabaseMatchesMappings()
        {
            IDictionary<string, IClassMetadata> allClassMetadata =
                NHibernateSession.SessionFactories[factoryKey].GetAllClassMetadata();

            foreach (KeyValuePair<string, IClassMetadata> entry in allClassMetadata)
            {
                NHibernateSession.CurrentFor(factoryKey).CreateCriteria(entry.Value.GetMappedClass(EntityMode.Poco))
                     .SetMaxResults(0).List();
            }
        }

        [Test]
        public void WriteMappingsToFile()
        {
            var mappings = new AutoPersistenceModelGenerator().Generate();
            mappings.CompileMappings();
            mappings.WriteMappingsTo(DB_FOLDER_PATH);
        }

        [Test]
        public void ExportSchemaToFile()
        {
            PrepareSchemaExport(true).Execute(true, false, false, null, new StreamWriter(DB_FOLDER_PATH + "DbSchema.sql"));
        }

        [TearDown]
        public virtual void TearDown()
        {
            if (NHibernateSession.Storages[factoryKey].Session != null)
            {
                NHibernateSession.Storages[factoryKey].Session.Dispose();
            }

            NHibernateSession.SessionFactory = null;
            NHibernateSession.Storage = null;
        }

        private static Configuration GetDatabaseCfg(bool useLiveDb)
        {
            var mappingAssemblies = RepositoryTestsHelper.GetMappingAssemblies();
            return useLiveDb
                       ? NHibernateSession.Init(new SimpleSessionStorage(), mappingAssemblies,
                                                new AutoPersistenceModelGenerator().Generate(),
                                                LIVE_DB_CONFIG_PATH, LIVE_VAL_CONFIG_PATH)
                       :
                           NHibernateSession.Init(new SimpleSessionStorage(), mappingAssemblies,
                                                  new AutoPersistenceModelGenerator().Generate());
        }

        private static SchemaExport PrepareSchemaExport(bool useLiveDb)
        {
            return new SchemaExport(GetDatabaseCfg(useLiveDb));
        }

        private static SchemaUpdate PrepareSchemaUpdate(bool useLiveDb)
        {
            return new SchemaUpdate(GetDatabaseCfg(useLiveDb));
        }

        private const string LIVE_DB_CONFIG_PATH = "../../../../app/DI.Colef.Sia.Web/NHibernate.config";
        private const string LIVE_VAL_CONFIG_PATH = "../../../../app/DI.Colef.Sia.Web/NHvalidator.config";
        private const string DB_FOLDER_PATH = "../../../../db/";

        string factoryKey = "nhibernate.tests_using_live_database";
    }
}
