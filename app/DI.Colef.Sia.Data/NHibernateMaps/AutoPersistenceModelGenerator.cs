using System;
using System.Linq;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Data.NHibernateMaps.Alteration;
using DecisionesInteligentes.Colef.Sia.Data.NHibernateMaps.Conventions;
using FluentNHibernate;
using FluentNHibernate.AutoMap;
using FluentNHibernate.Conventions;
using SharpArch.Core.DomainModel;
using SharpArch.Data.NHibernate.FluentNHibernate;
using DI.Colef.Sia.Data.NHibernateMaps.Conventions;

namespace DecisionesInteligentes.Colef.Sia.Data.NHibernateMaps
{
    public class AutoPersistenceModelGenerator : IAutoPersistenceModelGenerator
    {
        public AutoPersistenceModel Generate()
        {
            AutoPersistenceModel mappings = AutoPersistenceModel
                // If you delete the default class, simply point the following line to an entity within the .Core layer
                .MapEntitiesFromAssemblyOf<Rol>()
                .Where(GetAutoMappingFilter)
                .ConventionDiscovery.Setup(GetConventions())
                .WithSetup(GetSetup())
                .WithAlterations(GetAlterations())
                .UseOverridesFromAssemblyOf<AutoPersistenceModelGenerator>();

            return mappings;
        }

        Action<AutoMappingAlterationCollection> GetAlterations()
        {
            return c =>
                {
                    c.Add<CoautorInternoAlteration>();
                    c.Add<CoautorExternoAlteration>();
                };
        }

        private Action<AutoMappingExpressions> GetSetup()
        {
            return c =>
                {
                    c.FindIdentity = type => type.Name == "Id";
                    c.IsBaseType = IsBaseTypeConvention;
                };
        }

        private Action<IConventionFinder> GetConventions()
        {
            return c =>
                {
                    c.Add<PrimaryKeyConvention>();
                    c.Add<ReferenceConvention>();
                    c.Add<HasManyConvention>();
                    c.Add<TableNameConvention>();
                    c.Add<HasManyToManyConvention>();
                };
        }

        /// <summary>
        /// Provides a filter for only including types which inherit from the IEntityWithTypedId interface.
        /// </summary>
        private bool GetAutoMappingFilter(Type t)
        {
            return t.GetInterfaces().Any(x =>
                                         x.IsGenericType && x.GetGenericTypeDefinition() == typeof(IEntityWithTypedId<>));
        }

        private bool IsBaseTypeConvention(Type arg)
        {
            bool derivesFromEntity = arg == typeof(Entity);
            bool derivesFromEntityWithTypedId = arg.IsGenericType &&
                                                (arg.GetGenericTypeDefinition() == typeof(EntityWithTypedId<>));

            return derivesFromEntity || derivesFromEntityWithTypedId;
        }
    }
}