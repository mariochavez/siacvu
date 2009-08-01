using FluentNHibernate.Conventions;
using FluentNHibernate.Mapping;
using uNhAddIns.Inflector;

namespace DI.Colef.Sia.Data.NHibernateMaps.Conventions
{
    public class TableNameConvention : IClassConvention
    {
        public bool Accept(IClassMap classMap)
        {
            return true;
        }

        public void Apply(IClassMap classMap)
        {
            var spanishInflector = new SpanishInflector();

            classMap.WithTable(spanishInflector.Pluralize(classMap.EntityType.Name));
        }
    }
}
