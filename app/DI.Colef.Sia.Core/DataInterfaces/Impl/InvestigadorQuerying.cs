using System;
using System.Collections.Generic;
using NHibernate;
using NHibernate.Criterion;
using SharpArch.Data.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.Core.DataInterfaces
{
    public class InvestigadorQuerying : IInvestigadorQuerying
    {
        protected virtual ISession Session
        {
            get
            {
                string factoryKey = SessionFactoryAttribute.GetKeyFrom(this);
                return NHibernateSession.CurrentFor(factoryKey);
            }
        }

        public Investigador FindInvestigadorByUsuario(Usuario usuario)
        {
            var investigadorList = Session.CreateCriteria(typeof (Investigador))
                .CreateAlias("Usuario", "u")
                .Add(Expression.Eq("u.Id", usuario.Id))
                .List<Investigador>();

            return investigadorList.Count == 0 ? null : investigadorList[0];
        }

        public Investigador[] GetActiveInvestigadores(Usuario usuario)
        {
            var investigadores = DetachedCriteria.For(typeof (Investigador))
                .CreateAlias("Usuario", "u")
                .SetProjection(Projections.ProjectionList()
                                   .Add(Projections.Property("u.Id"), "UsuarioId"));

            var investigadorList = Session.CreateCriteria(typeof(Investigador))
                .CreateAlias("Usuario", "u")
                .Add(Subqueries.Ne(usuario.Id, investigadores))
                .List<Investigador>();

            return ((List<Investigador>) investigadorList).ToArray();
        }
    }
}