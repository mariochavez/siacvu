using FluentNHibernate.Conventions;
using FluentNHibernate.Mapping;

namespace DecisionesInteligentes.Colef.Sia.Data.NHibernateMaps.Conventions
{
    public class ByteArrayConvention : IPropertyConvention
    {
        public bool Accept(IProperty property)
        {
            return true;
        }

        public void Apply(IProperty property)
        {
            if(property.PropertyType == typeof(byte[]))
                property.CustomSqlTypeIs("image");
        }
    }
}
