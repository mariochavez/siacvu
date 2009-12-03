using System;
using System.Collections;
using System.Collections.Generic;
using NHibernate;
using NHibernate.Criterion;
using SharpArch.Data.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.Core.DataInterfaces
{
    public class ProductoQuerying : IProductoQuerying
    {
        protected virtual ISession Session
        {
            get
            {
                string factoryKey = SessionFactoryAttribute.GetKeyFrom(this);
                return NHibernateSession.CurrentFor(factoryKey);
            }
        }

        public T[] GetProductosByUsuario<T>(Usuario usuario, string coautorTableName)
        {
            var investigadorList = Session.CreateCriteria(typeof (Investigador))
                .CreateAlias("Usuario", "u")
                .Add(Expression.Eq("u.Id", usuario.Id))
                .List<Investigador>();

            var investigador = investigadorList.Count == 0 ? null : investigadorList[0];

            var productoList1 = Session.CreateCriteria(typeof (T))
                .CreateAlias("Usuario", "u")
                .Add(Expression.Eq("u.Id", usuario.Id))
                .Add(Expression.Eq("Activo", true))
                .List<T>();

            var productoList2 = Session.CreateCriteria(typeof (T))
                .CreateAlias(coautorTableName, "cia")
                .Add(Expression.Eq("cia.Investigador", investigador))
                .Add(Expression.Eq("Activo", true))
                .List<T>();

            var productoList = ((List<T>) productoList1);
            productoList.AddRange(productoList2);

            return productoList.ToArray();
        }

        public ProductoDTO[] GetProductosBandeja(Usuario usuario, DateTime fechaInicial)
        {
            IMultiCriteria queries = Session.CreateMultiCriteria()
                .Add(
                Session.CreateCriteria(typeof (Articulo))
                    .AddOrder(Order.Desc("CreadoEl"))
                    .CreateAlias("Usuario", "u")
                    .CreateAlias("CoautorInternoArticulos", "co")
                    .CreateAlias("co.Investigador", "i")
                    .CreateAlias("i.Usuario", "iu")
                    .SetProjection(Projections.ProjectionList()
                                       .Add(Projections.Property("Id"), "Id")
                                       .Add(Projections.Property("Titulo"), "Nombre")
                                       .Add(Projections.Constant(1), "TipoProducto"))
                    .SetResultTransformer(NHibernate.Transform.Transformers.AliasToBean(typeof (ProductoDTO)))
                    .Add(Expression.Or(Expression.Eq("u.Id", usuario.Id), Expression.Eq("iu.Id", usuario.Id)))
                ).Add(Session.CreateCriteria(typeof (Libro))
                          .AddOrder(Order.Desc("CreadoEl"))
                          .CreateAlias("Usuario", "u")
                          .CreateAlias("CoautorInternoLibros", "co")
                          .CreateAlias("co.Investigador", "i")
                          .CreateAlias("i.Usuario", "iu")
                          .SetProjection(Projections.ProjectionList()
                                             .Add(Projections.Property("Id"), "Id")
                                             .Add(Projections.Property("Nombre"), "Nombre")
                                             .Add(Projections.Constant(2), "TipoProducto"))
                          .SetResultTransformer(NHibernate.Transform.Transformers.AliasToBean(typeof (ProductoDTO)))
                          .Add(Expression.Or(Expression.Eq("u.Id", usuario.Id), Expression.Eq("iu.Id", usuario.Id)))
                );

            var resultado = new ArrayList();
            foreach (var producto in queries.List())
            {
                resultado.AddRange((ICollection) producto);
            }

            return (ProductoDTO[]) resultado.ToArray(typeof (ProductoDTO));
        }
    }

    public class ProductoDTO
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public int TipoProducto { get; set; }
    }
}