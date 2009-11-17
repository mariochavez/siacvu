using System;
using System.Collections.Generic;
using NHibernate;
using NHibernate.Criterion;
using SharpArch.Data.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.Core.DataInterfaces
{
    public class TesisPosgradoQuerying : ITesisPosgradoQuerying
    {
        protected virtual ISession Session
        {
            get
            {
                string factoryKey = SessionFactoryAttribute.GetKeyFrom(this);
                return NHibernateSession.CurrentFor(factoryKey);
            }
        }

        public TesisPosgrado[] FindActiveTesisPosgrados()
        {
            //var investigadores = DetachedCriteria.For(typeof (TesisDirigida))
            //    .CreateAlias("TesisPosgrado", "a")
            //    .SetProjection(Projections.ProjectionList()
            //                       .Add(Projections.Property("a.Id"), "AlumnoId"));

            var tesisPosgrados = Session.CreateCriteria(typeof(TesisPosgrado))
                .AddOrder(Order.Asc("Titulo"))
                .List<TesisPosgrado>();

            return ((List<TesisPosgrado>) tesisPosgrados).ToArray();
        }
    }
}