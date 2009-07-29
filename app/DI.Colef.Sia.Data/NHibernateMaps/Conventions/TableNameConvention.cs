using FluentNHibernate.Conventions;
using FluentNHibernate.Mapping;

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
            if (classMap.EntityType.Name.EndsWith("l"))
                classMap.WithTable(classMap.EntityType.Name + "es");
            else if (classMap.EntityType.Name.EndsWith("n"))
                classMap.WithTable(classMap.EntityType.Name + "es");
            else if (classMap.EntityType.Name.EndsWith("r"))
                classMap.WithTable(classMap.EntityType.Name + "es");
            else if (classMap.EntityType.Name.EndsWith("d"))
                classMap.WithTable(classMap.EntityType.Name + "es");
            else
                classMap.WithTable(Inflector.Net.Inflector.Pluralize(classMap.EntityType.Name));
        }
    }
}
