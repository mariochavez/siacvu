using System;
using System.Collections.Generic;
using NHibernate;
using NHibernate.Criterion;
using SharpArch.Data.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.Core.DataInterfaces
{
    public class AlumnoQuerying : IAlumnoQuerying
    {
        protected virtual ISession Session
        {
            get
            {
                string factoryKey = SessionFactoryAttribute.GetKeyFrom(this);
                return NHibernateSession.CurrentFor(factoryKey);
            }
        }

        public Alumno[] FindActiveAlumnos()
        {
            //var investigadores = DetachedCriteria.For(typeof (TesisDirigida))
            //    .CreateAlias("Alumno", "a")
            //    .SetProjection(Projections.ProjectionList()
            //                       .Add(Projections.Property("a.Id"), "AlumnoId"));

            var alumnos = Session.CreateCriteria(typeof(Alumno))
                .AddOrder(Order.Asc("Nombre"))
                .List<Alumno>();

            return ((List<Alumno>) alumnos).ToArray();
        }
    }
}