using System;
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
    }
}