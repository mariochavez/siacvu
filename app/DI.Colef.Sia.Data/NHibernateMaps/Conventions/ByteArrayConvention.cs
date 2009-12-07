using FluentNHibernate.Conventions;
using FluentNHibernate.Mapping;

namespace DecisionesInteligentes.Colef.Sia.Data.NHibernateMaps.Conventions
{
    public class ByteArrayConvention : IPropertyConvention
    {
        public bool Accept(IProperty property)
        {
            return property.Property.Name.Contains("Resumen") || property.Property.Name.Contains("Descripcion") || 
                property.Property.Name.Contains("Titulo") || 
                property.Property.Name.Contains("Nombre") || property.PropertyType == typeof(byte[]);
        }

        public void Apply(IProperty property)
        {
            if (property.PropertyType == typeof(byte[]))
                property.CustomSqlTypeIs("image");

            if (property.Property.Name.Contains("Nombre") || property.Property.Name.Contains("Titulo"))
            {
                property.WithLengthOf(250);
                //property.Not.Nullable();
            }

            if (property.Property.Name.Contains("Resumen") || property.Property.Name.Contains("Descripcion"))
                property.WithLengthOf(400);
        }
    }
}
