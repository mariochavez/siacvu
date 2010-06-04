using System;
using Castle.Windsor;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using SharpArch.Core.PersistenceSupport.NHibernate;
using SharpArch.Data.NHibernate;
using SharpArch.Core.PersistenceSupport;
using SharpArch.Web.Castle;
using Castle.MicroKernel.Registration;
using SharpArch.Core.CommonValidator;
using SharpArch.Core.NHibernateValidator.CommonValidatorAdapter;

namespace DecisionesInteligentes.Colef.Sia.Web.CastleWindsor
{
    public class ComponentRegistrar
    {
        public static void AddComponentsTo(IWindsorContainer container)
        {
            AddGenericRepositoriesTo(container);
            AddCustomRepositoriesTo(container);
            AddApplicationServicesTo(container);
            AddMappersTo(container);
            AddQueryingTo(container);
            AddCommonTo(container);

            container.AddComponent("validator",
                                   typeof(IValidator), typeof(Validator));
        }

        static void AddCommonTo(IWindsorContainer container)
        {
            container.Register(
                AllTypes.Pick()
                    .FromAssemblyNamed("DecisionesInteligentes.Colef.Sia.Web.Controllers")
                    .If(x => x.Namespace.EndsWith("Security"))
                    .WithService.FirstInterface());

            container.Register(
                AllTypes.Pick()
                    .FromAssemblyNamed("DecisionesInteligentes.Colef.Sia.Web.Controllers")
                    .If(x => x.Name.EndsWith("Collection"))
                    .WithService.FirstNonGenericCoreInterface(
                    "DecisionesInteligentes.Colef.Sia.Web.Controllers.Collections"));
        }

        static void AddQueryingTo(IWindsorContainer container)
        {
            container.Register(
                AllTypes.Pick()
                    .FromAssemblyNamed("DecisionesInteligentes.Colef.Sia.Core")
                    .WithService.FirstNonGenericCoreInterface("DecisionesInteligentes.Colef.Sia.Core.DataInterfaces"));
        }

        private static void AddMappersTo(IWindsorContainer container)
        {
            container.Register(
                AllTypes.Pick()
                    .FromAssemblyNamed("DecisionesInteligentes.Colef.Sia.Web.Controllers")
                    .If(x => x.Name.EndsWith("Mapper"))
                    .WithService.FirstNonGenericCoreInterface("DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers"));

            container.AddComponent("editorialProductoMapper",
                                   typeof (IEditorialProductoMapper<>), typeof (EditorialProductoMapper<>));
            container.AddComponent("institucionProductoMapper", typeof (IInstitucionProductoMapper<>),
                                   typeof (InstitucionProductoMapper<>));
        }

        private static void AddApplicationServicesTo(IWindsorContainer container)
        {
            container.Register(
                AllTypes.Pick()
                    .FromAssemblyNamed("DecisionesInteligentes.Colef.Sia.ApplicationServices")
                    .WithService.FirstInterface());
        }

        private static void AddCustomRepositoriesTo(IWindsorContainer container)
        {
            container.Register(
                AllTypes.Pick()
                    .FromAssemblyNamed("DecisionesInteligentes.Colef.Sia.Data")
                    .WithService.FirstNonGenericCoreInterface("DecisionesInteligentes.Colef.Sia.Core"));
        }

        private static void AddGenericRepositoriesTo(IWindsorContainer container)
        {
            container.AddComponent("entityDuplicateChecker",
                                   typeof(IEntityDuplicateChecker), typeof(EntityDuplicateChecker));
            container.AddComponent("repositoryType",
                                   typeof(IRepository<>), typeof(Repository<>));
            container.AddComponent("nhibernateRepositoryType",
                                   typeof(INHibernateRepository<>), typeof(NHibernateRepository<>));
            container.AddComponent("repositoryWithTypedId",
                                   typeof(IRepositoryWithTypedId<,>), typeof(RepositoryWithTypedId<,>));
            container.AddComponent("nhibernateRepositoryWithTypedId",
                                   typeof(INHibernateRepositoryWithTypedId<,>), typeof(NHibernateRepositoryWithTypedId<,>));
        }
    }
}