using System;
using System.Collections.Generic;
using NHibernate;
using NHibernate.Criterion;
using NHibernate.SqlCommand;
using SharpArch.Data.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.Core.DataInterfaces
{
    public class SearchQuerying : ISearchQuerying
    {
        protected virtual ISession Session
        {
            get
            {
                string factoryKey = SessionFactoryAttribute.GetKeyFrom(this);
                return NHibernateSession.CurrentFor(factoryKey);
            }
        }

        public Search[] Search<TEntity>(string fieldName, string value)
        {
            var list = Session.CreateCriteria(typeof (TEntity))
                .AddOrder(Order.Asc(fieldName))
                .SetMaxResults(20)
                .SetProjection(Projections.ProjectionList()
                                   .Add(Projections.Property("Id"), "Id")
                                   .Add(Projections.Property(fieldName), "Nombre"))
                .SetResultTransformer(NHibernate.Transform.Transformers.AliasToBean(typeof (Search)))
                .Add(Expression.Like(fieldName, "%" + value + "%"))
                .List<Search>();

            return ((List<Search>) list).ToArray();
        }

        public Search[] SearchInvestigador(string value)
        {
            string[] values = value.Split(' ');

            var criteria = DetachedCriteria.For(typeof (Investigador))
                .CreateAlias("Usuario", "u", JoinType.InnerJoin)
                .CreateAlias("u.Persona", "p", JoinType.InnerJoin)
                .SetFetchMode("Usuario", FetchMode.Eager)
                .SetFetchMode("u.Persona", FetchMode.Eager)
                .SetMaxResults(20)
                .SetProjection(Projections.ProjectionList()
                                   .Add(Projections.Property("p.ApellidoPaterno"), "ApellidoPaterno")
                                   .Add(Projections.Property("p.ApellidoMaterno"), "ApellidoMaterno")
                                   .Add(Projections.Property("p.Nombre"), "Nombre")
                                   .Add(Projections.Property("Id"), "Id")
                )
                .AddOrder(Order.Asc("p.ApellidoPaterno"))
                .AddOrder(Order.Asc("p.ApellidoMaterno"))
                .AddOrder(Order.Asc("p.Nombre"))
                .SetResultTransformer(NHibernate.Transform.Transformers.AliasToBean(typeof (InvestigadorDTO)));

            if (values.Length == 1)
                criteria.Add(Expression.Or(Expression.Or(Expression.Like("p.ApellidoPaterno", values[0] + "%"),
                                                         Expression.Like("p.ApellidoMaterno", values[0] + "%")), Expression.Like("p.Nombre", values[0] + "%")));
            else if (values.Length == 2)
                criteria.Add(Expression.Or(Expression.Or(Expression.Like("p.ApellidoPaterno", values[0] + "%"),
                                                         Expression.Like("p.ApellidoMaterno", values[0] + "%")), Expression.Like("p.Nombre", values[1] + "%")));
            else if (values.Length == 3)
                criteria.Add(Expression.Or(Expression.Or(Expression.Like("p.ApellidoPaterno", values[0] + "%"),
                                                         Expression.Like("p.ApellidoMaterno", values[1] + "%")), Expression.Like("p.Nombre", values[2] + "%")));
            else if (values.Length > 3)
            {
                var nombre = String.Empty;
                for (var i = 2; i < values.Length; i++)
                    nombre += value[i] + " ";
                
                criteria.Add(Expression.Or(Expression.Or(Expression.Like("p.ApellidoPaterno", values[0] + "%"),
                                                         Expression.Like("p.ApellidoMaterno", values[1] + "%")),
                                           Expression.Like("p.Nombre", nombre.Trim() + "%")));
            }

            var list = criteria.GetExecutableCriteria(Session).List<InvestigadorDTO>();

            var result = new List<Search>();
            foreach (var item in list)
            {
                result.Add(new Search { Id = item.Id, Nombre = item.NombreCompleto() });
            }

            return result.ToArray();
        }

        public Search[] SearchMovilidadAcademica(string value)
        {
            var criteria = DetachedCriteria.For(typeof(MovilidadAcademica))
                .CreateAlias("LineaTematica", "lt", JoinType.InnerJoin)
                .SetFetchMode("LineaTematica", FetchMode.Eager)
                .SetMaxResults(20)
                .SetProjection(Projections.ProjectionList()
                                   .Add(Projections.Property("lt.Nombre"), "Nombre")
                                   .Add(Projections.Property("Id"), "Id")
                )
                .AddOrder(Order.Asc("lt.Nombre"))
                .SetResultTransformer(NHibernate.Transform.Transformers.AliasToBean(typeof(MovilidadAcademicaDTO)));

            var list = criteria.GetExecutableCriteria(Session).List<MovilidadAcademicaDTO>();

            var result = new List<Search>();
            foreach (var item in list)
            {
                result.Add(new Search { Id = item.Id, Nombre = item.Nombre });
            }

            return result.ToArray();
        }

        class InvestigadorDTO
        {
            public int Id { get; set; }
            public string ApellidoPaterno { get; set; }
            public string ApellidoMaterno { get; set; }
            public string Nombre { get; set; }

            public string NombreCompleto()
            {
                return String.Format("{0} {1} {2}", ApellidoPaterno, ApellidoMaterno, Nombre).Trim();
            }
        }

        class MovilidadAcademicaDTO
        {
            public int Id { get; set; }
            public string Nombre { get; set; }
        }
    }
}