using FluentNHibernate.Conventions;
using FluentNHibernate.Mapping;

namespace DecisionesInteligentes.Colef.Sia.Data.NHibernateMaps.Conventions
{
    public class HasManyToManyConvention : IHasManyToManyConvention
    {
        public bool Accept(IManyToManyPart target)
        {
            return true;
        }

        public void Apply(IManyToManyPart target)
        {
            target.WithParentKeyColumn(target.EntityType.Name + "Fk");
            target.WithChildKeyColumn(target.ChildType.Name + "Fk");

            target.WithTableName(GetTablename(target));
        }

        string GetTablename(IManyToManyPart target)
        {
            string tablename = target.ChildType.Name + target.EntityType.Name;
            if (target.ChildType.Name == "Usuario")
            {
                tablename = target.ChildType.Name + target.EntityType.Name;
                target.Inverse();
                target.Cascade.None();
            }
            else if (target.EntityType.Name == "Usuario")
            {
                tablename = target.EntityType.Name + target.ChildType.Name;
                target.Not.Inverse();
                target.Cascade.SaveUpdate();
            }

            return tablename;
        }
    }
}
