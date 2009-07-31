using System.Collections.Generic;
using NHibernate;
using NHibernate.Criterion;
using SharpArch.Data.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.Core.DataInterfaces
{
    public class UsuarioQuerying : IUsuarioQuerying
    {
        protected virtual ISession Session
        {
            get
            {
                string factoryKey = SessionFactoryAttribute.GetKeyFrom(this);
                return NHibernateSession.CurrentFor(factoryKey);
            }
        }

        public Usuario[] FindUsuariosToBeInvestigador()
        {
            var investigadores = DetachedCriteria.For(typeof (Investigador))
                .CreateAlias("Usuario", "u")
                .SetProjection(Projections.ProjectionList()
                                   .Add(Projections.Property("u.Id"), "UsuarioId"));

            var usuarios = Session.CreateCriteria(typeof (Usuario))
                .CreateAlias("Roles", "r")
                .CreateAlias("Persona", "p")
                .Add(Expression.Eq("r.Nombre", "Investigadores"))
                .Add(Expression.Eq("r.Activo", true))
                .Add(Subqueries.PropertyNotIn("Id", investigadores))
                .AddOrder(Order.Asc("p.ApellidoPaterno"))
                .AddOrder(Order.Asc("p.ApellidoMaterno"))
                .AddOrder(Order.Asc("p.Nombre"))
                .List<Usuario>();

            return ((List<Usuario>) usuarios).ToArray();
        }
    }
}