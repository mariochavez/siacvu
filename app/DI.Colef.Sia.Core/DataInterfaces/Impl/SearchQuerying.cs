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

        #region ISearchQuerying Members

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
                .Add(Expression.Eq("Activo", true))
                .List<Search>();

            return ((List<Search>) list).ToArray();
        }

        public Search[] SearchInvestigador(string value)
        {
            string[] values = value.Split(' ');

            var criteria = DetachedCriteria.For(typeof (Investigador))
                .CreateAlias("Usuario", "u", JoinType.InnerJoin)
                .SetFetchMode("Usuario", FetchMode.Eager)
                .SetMaxResults(20)
                .SetProjection(Projections.ProjectionList()
                                   .Add(Projections.Property("u.ApellidoPaterno"), "ApellidoPaterno")
                                   .Add(Projections.Property("u.ApellidoMaterno"), "ApellidoMaterno")
                                   .Add(Projections.Property("u.Nombre"), "Nombre")
                                   .Add(Projections.Property("Id"), "Id")
                )
                .AddOrder(Order.Asc("u.ApellidoPaterno"))
                .AddOrder(Order.Asc("u.ApellidoMaterno"))
                .AddOrder(Order.Asc("u.Nombre"))
                .SetResultTransformer(NHibernate.Transform.Transformers.AliasToBean(typeof (InvestigadorDTO)));

            if (values.Length == 1)
                criteria.Add(Expression.Or(Expression.Or(Expression.Like("u.ApellidoPaterno", values[0] + "%"),
                                                         Expression.Like("u.ApellidoMaterno", values[0] + "%")),
                                           Expression.Like("u.Nombre", values[0] + "%")));
            else if (values.Length == 2)
                criteria.Add(Expression.Or(Expression.Or(Expression.Like("u.ApellidoPaterno", values[0] + "%"),
                                                         Expression.Like("u.ApellidoMaterno", values[0] + "%")),
                                           Expression.Like("u.Nombre", values[1] + "%")));
            else if (values.Length == 3)
                criteria.Add(Expression.Or(Expression.Or(Expression.Like("u.ApellidoPaterno", values[0] + "%"),
                                                         Expression.Like("u.ApellidoMaterno", values[1] + "%")),
                                           Expression.Like("u.Nombre", values[2] + "%")));
            else if (values.Length > 3)
            {
                var nombre = String.Empty;
                for (var i = 2; i < values.Length; i++)
                    nombre += value[i] + " ";

                criteria.Add(Expression.Or(Expression.Or(Expression.Like("u.ApellidoPaterno", values[0] + "%"),
                                                         Expression.Like("u.ApellidoMaterno", values[1] + "%")),
                                           Expression.Like("u.Nombre", nombre.Trim() + "%")));
            }

            var list = criteria.GetExecutableCriteria(Session).List<InvestigadorDTO>();

            var result = new List<Search>();
            foreach (var item in list)
            {
                result.Add(new Search {Id = item.Id, Nombre = item.NombreCompleto()});
            }

            return result.ToArray();
        }

        public Search[] SearchMovilidadAcademica(string value)
        {
            var criteria = DetachedCriteria.For(typeof (MovilidadAcademica))
                .CreateAlias("Institucion", "i", JoinType.InnerJoin)
                .SetFetchMode("Institucion", FetchMode.Eager)
                .SetMaxResults(20)
                .SetProjection(Projections.ProjectionList()
                                   .Add(Projections.Property("i.Nombre"), "Nombre")
                                   .Add(Projections.Property("Id"), "Id")
                )
                .AddOrder(Order.Asc("i.Nombre"))
                .SetResultTransformer(NHibernate.Transform.Transformers.AliasToBean(typeof (MovilidadAcademicaDTO)));

            var list = criteria.GetExecutableCriteria(Session).List<MovilidadAcademicaDTO>();

            var result = new List<Search>();
            foreach (var item in list)
            {
                result.Add(new Search {Id = item.Id, Nombre = item.Nombre});
            }

            return result.ToArray();
        }

        public Search[] SearchApoyoConacyt(string value)
        {
            var criteria = DetachedCriteria.For(typeof(ApoyoConacyt))
                .CreateAlias("TipoApoyo", "ta", JoinType.InnerJoin)
                .SetFetchMode("TipoApoyo", FetchMode.Eager)
                .SetMaxResults(20)
                .SetProjection(Projections.ProjectionList()
                                   .Add(Projections.Property("ta.Nombre"), "Nombre")
                                   .Add(Projections.Property("Id"), "Id")
                )
                .AddOrder(Order.Asc("ta.Nombre"))
                .SetResultTransformer(NHibernate.Transform.Transformers.AliasToBean(typeof(ApoyoConacytDTO)));

            var list = criteria.GetExecutableCriteria(Session).List<ApoyoConacytDTO>();

            var result = new List<Search>();
            foreach (var item in list)
            {
                result.Add(new Search { Id = item.Id, Nombre = item.Nombre });
            }

            return result.ToArray();
        }

        public Search[] SearchIdiomaInvestigador(string value)
        {
            var criteria = DetachedCriteria.For(typeof (IdiomasInvestigador))
                .CreateAlias("Idioma", "i", JoinType.InnerJoin)
                .SetFetchMode("Idioma", FetchMode.Eager)
                .SetMaxResults(20)
                .SetProjection(Projections.ProjectionList()
                                   .Add(Projections.Property("i.Nombre"), "Nombre")
                                   .Add(Projections.Property("Id"), "Id")
                )
                .AddOrder(Order.Asc("i.Nombre"))
                .SetResultTransformer(NHibernate.Transform.Transformers.AliasToBean(typeof (IdiomaInvestigadorDTO)));

            var list = criteria.GetExecutableCriteria(Session).List<IdiomaInvestigadorDTO>();

            var result = new List<Search>();
            foreach (var item in list)
            {
                result.Add(new Search {Id = item.Id, Nombre = item.Nombre});
            }

            return result.ToArray();
        }

        #endregion

        #region Nested type: InvestigadorDTO

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

        #endregion

        #region Nested type: MovilidadAcademicaDTO

        class MovilidadAcademicaDTO
        {
            public int Id { get; set; }
            public string Nombre { get; set; }
        }

        #endregion

        #region Nested type: ApoyoConacytDTO

        class ApoyoConacytDTO
        {
            public int Id { get; set; }
            public string Nombre { get; set; }
        }

        #endregion

        #region Nested type: IdiomaInvestigadorDTO

        class IdiomaInvestigadorDTO
        {
            public int Id { get; set; }
            public string Nombre { get; set; }
        }

        #endregion
    }
}