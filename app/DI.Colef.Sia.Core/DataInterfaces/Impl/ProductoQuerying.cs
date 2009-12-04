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

        public ProductoDTO[] GetProductosBandeja(Usuario usuario)
        {
            var bandejaTrabajo = new object[4];

            IMultiCriteria produccionAcademica = Session.CreateMultiCriteria()
                .Add(BuildCreteria<Articulo>(usuario.Id, "CoautorInternoArticulos", "Titulo", 1))
                .Add(BuildCreteria<Capitulo>(usuario.Id, "CoautorInternoCapitulos", "NombreCapitulo", 2))
                .Add(BuildCreteria<Libro>(usuario.Id, "CoautorInternoLibros", "Nombre", 7));


            IMultiCriteria formacionRecursosHumanos = Session.CreateMultiCriteria()
                            .Add(BuildCreteria<Articulo>(usuario.Id, "CoautorInternoArticulos", "Titulo", 1))
                            .Add(BuildCreteria<Capitulo>(usuario.Id, "CoautorInternoCapitulos", "NombreCapitulo", 2))
                            .Add(BuildCreteria<Libro>(usuario.Id, "CoautorInternoLibros", "Nombre", 7));



            var resultado = new ArrayList();
            foreach (var producto in produccionAcademica.List())
            {
                resultado.AddRange((ICollection) producto);
            }

            return (ProductoDTO[]) resultado.ToArray(typeof (ProductoDTO));
        }

        private ICriteria BuildCreteria<T>(int usuarioId, string tableName, string propertyName, int productType)
        {
            return Session.CreateCriteria(typeof (T))
                .AddOrder(Order.Desc("CreadoEl"))
                .CreateAlias("Usuario", "u")
                .CreateAlias(tableName, "co")
                .CreateAlias("co.Investigador", "i")
                .CreateAlias("i.Usuario", "iu")
                .SetProjection(Projections.ProjectionList()
                                   .Add(Projections.Property("Id"), "Id")
                                   .Add(Projections.Property(propertyName), "Nombre")
                                   .Add(Projections.Constant(productType), "TipoProducto")
                                   .Add(Projections.Property("CreadoEl"), "CreadoEl"))
                .SetResultTransformer(NHibernate.Transform.Transformers.AliasToBean(typeof (ProductoDTO)))
                .Add(Expression.Or(Expression.Eq("u.Id", usuarioId), Expression.Eq("iu.Id", usuarioId)));
        }
    }

    public class ProductoDTO
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public int TipoProducto { get; set; }
        public DateTime CreadoEl { get; set; }
    }
}