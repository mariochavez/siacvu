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

        public TesisPosgrado[] FindUnsedTesisInvestigador(Investigador investigador)
        {
            var tesis = DetachedCriteria.For(typeof(TesisDirigida))
               .CreateAlias("TesisPosgrado", "tp")
               .SetProjection(Projections.ProjectionList()
                                  .Add(Projections.Property("tp.Id"), "TesisPosgradoId"));

            var tesisPosgrado = Session.CreateCriteria(typeof(TesisPosgrado))
                .Add(Expression.Eq("Investigador", investigador))
                .Add(Subqueries.PropertyNotIn("Id", tesis))
                .List<TesisPosgrado>();

            return ((List<TesisPosgrado>) tesisPosgrado).ToArray();
        }
    }
}