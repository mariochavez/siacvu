using System;
using System.Collections.Generic;
using NHibernate;
using NHibernate.Criterion;
using SharpArch.Data.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.Core.DataInterfaces
{
    public class CursoInvestigadorQuerying : ICursoInvestigadorQuerying
    {
        protected virtual ISession Session
        {
            get
            {
                string factoryKey = SessionFactoryAttribute.GetKeyFrom(this);
                return NHibernateSession.CurrentFor(factoryKey);
            }
        }

        public CursoInvestigador[] FindUnsedCursosInvestigador(Investigador investigador)
        {
            var cursos = DetachedCriteria.For(typeof (Curso))
                .CreateAlias("CursoInvestigador", "ci")
                .SetProjection(Projections.ProjectionList()
                                   .Add(Projections.Property("ci.Id"), "CursoInvestigadorId"));

            var cursoInvestigador = Session.CreateCriteria(typeof (CursoInvestigador))
                .Add(Expression.Eq("Investigador", investigador))
                .Add(Subqueries.PropertyNotIn("Id", cursos))
                .List<CursoInvestigador>();

            return ((List<CursoInvestigador>) cursoInvestigador).ToArray();
        }
    }
}