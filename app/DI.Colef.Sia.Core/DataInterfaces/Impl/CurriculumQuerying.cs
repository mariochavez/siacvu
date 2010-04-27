using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using NHibernate;
using NHibernate.Criterion;
using NHibernate.SqlCommand;
using SharpArch.Data.NHibernate;
using Expression = NHibernate.Criterion.Expression;

namespace DecisionesInteligentes.Colef.Sia.Core.DataInterfaces.Impl
{
    public class CurriculumQuerying : ICurriculumQuerying
    {
        protected virtual ISession Session
        {
            get
            {
                string factoryKey = SessionFactoryAttribute.GetKeyFrom(this);
                return NHibernateSession.CurrentFor(factoryKey);
            }
        }

        public object[] GetListaProductos(Usuario usuario)
        {
            var listaProductos = new object[5];

            IMultiCriteria produccionAcademica = Session.CreateMultiCriteria()
                .Add(BuildCriteria<Articulo>(usuario, x => x.Titulo))
                .Add(BuildCriteria<Libro>(usuario, x => x.Nombre))
                .Add(BuildCriteria<Capitulo>(usuario, x => x.NombreCapitulo))
                .Add(BuildCriteria<ArticuloDifusion>(usuario, x => x.Titulo))
                .Add(BuildCriteria<Reporte>(usuario, x => x.Titulo))
                .Add(BuildCriteria<Resena>(usuario, x => x.NombreProducto))
                .Add(BuildCriteria<ObraTraducida>(usuario, x => x.Nombre));

            IMultiCriteria formacionRecursosHumanos = Session.CreateMultiCriteria()
                .Add(BuildCriteria<Curso>(usuario, x => x.Nombre))
                .Add(BuildCriteria<TesisDirigida>(usuario, x => x.Titulo));

            IMultiCriteria proyectos = Session.CreateMultiCriteria()
                .Add(BuildCriteria<Proyecto>(usuario, x => x.Nombre));

            IMultiCriteria vinculacionDifusion = Session.CreateMultiCriteria()
                .Add(BuildCriteria<Dictamen>(usuario, x => x.Nombre))
                .Add(BuildCriteria<OrganoExterno>(usuario, x => x.Nombre))
                .Add(BuildCriteria<ParticipacionMedio>(usuario, x => x.Titulo));

            IMultiCriteria eventos = Session.CreateMultiCriteria()
                .Add(BuildCriteria<Evento>(usuario, x => x.Nombre));

            var produccionAcademicaResultado = new List<CurriculumDTO>();
            foreach (ArrayList producto in produccionAcademica.List())
            {
                produccionAcademicaResultado.AddRange(producto.Cast<CurriculumDTO>());
            }

            var formacionRecursosHumanosResultado = new List<CurriculumDTO>();
            foreach (ArrayList producto in formacionRecursosHumanos.List())
            {
                formacionRecursosHumanosResultado.AddRange(producto.Cast<CurriculumDTO>());
            }

            var proyectosResultado = new List<CurriculumDTO>();
            foreach (ArrayList producto in proyectos.List())
            {
                proyectosResultado.AddRange(producto.Cast<CurriculumDTO>());
            }

            var vinculacionDifusionResultado = new List<CurriculumDTO>();
            foreach (ArrayList producto in vinculacionDifusion.List())
            {
                vinculacionDifusionResultado.AddRange(producto.Cast<CurriculumDTO>());
            }

            var eventosResultado = new List<CurriculumDTO>();
            foreach (ArrayList producto in eventos.List())
            {
                eventosResultado.AddRange(producto.Cast<CurriculumDTO>());
            }

            listaProductos[0] = produccionAcademicaResultado.ToArray();
            listaProductos[1] = formacionRecursosHumanosResultado.ToArray();
            listaProductos[2] = proyectosResultado.ToArray();
            listaProductos[3] = vinculacionDifusionResultado.ToArray();
            listaProductos[4] = eventosResultado.ToArray();

            return listaProductos;
        }

        ICriteria BuildCriteria<T>(Usuario usuario, Expression<Func<T, object>> productName)
        {
            var projection = Projections.ProjectionList()
                .Add(Projections.Property("Id"), "Id")
                .Add(Projections.Property(GetPropertyName(productName)), "Nombre")
                .Add(Projections.Constant((int) EntityHelper.GetTipoProducto<T>()), "TipoProducto")
                .Add(Projections.Property("CreadoEl"), "CreadoEl")

                .Add(Projections.Property("u.Nombre"), "UsuarioNombre")
                .Add(Projections.Property("u.ApellidoPaterno"), "UsuarioApellidoPaterno")
                .Add(Projections.Property("u.ApellidoMaterno"), "UsuarioApellidoMaterno")

                .Add(Projections.Property("f.Aceptacion1"), "FirmaAceptacion1")
                .Add(Projections.Property("f.Aceptacion2"), "FirmaAceptacion2");
            

            var criteria = Session.CreateCriteria(typeof(T))
                .CreateAlias("Usuario", "u")
                .CreateAlias("Firma", "f");

            var isInvestigador = (from role in usuario.Roles
                                  where role.Nombre == "Investigadores"
                                  select role).FirstOrDefault() != null;

            var fechaPublicacion = EntityHelper.GetPropertyName<T>("FechaPublicacion");
            if (!String.IsNullOrEmpty(fechaPublicacion))
            {
                projection.Add(Projections.Property("FechaPublicacion"), "FechaPublicacion");
            }

            var volumen = EntityHelper.GetPropertyName<T>("Volumen");
            if (!String.IsNullOrEmpty(volumen))
            {
                projection.Add(Projections.Property("Volumen"), "Volumen");
            }

            //var numero = EntityHelper.GetPropertyName<T>("Numero");
            //if (!String.IsNullOrEmpty(numero))
            //{
            //    projection.Add(Projections.Property("Numero"), "Numero");
            //}

            var paginaInicial = EntityHelper.GetPropertyName<T>("PaginaInicial");
            if (!String.IsNullOrEmpty(paginaInicial))
            {
                projection.Add(Projections.Property("PaginaInicial"), "PaginaInicial");
            }

            var paginaFinal = EntityHelper.GetPropertyName<T>("PaginaFinal");
            if (!String.IsNullOrEmpty(paginaFinal))
            {
                projection.Add(Projections.Property("PaginaFinal"), "PaginaFinal");
            }


            var revistaTable = EntityHelper.GetRevistaTable<T>();
            if (!String.IsNullOrEmpty(revistaTable))
            {
                criteria
                    .CreateAlias(revistaTable, "r", JoinType.LeftOuterJoin);

                projection.Add(Projections.Property("r.Titulo"), "RevistaNombre");
            }

            var institucionTable = EntityHelper.GetInstitucionTable<T>();
            if (!String.IsNullOrEmpty(institucionTable))
            {
                criteria
                    .CreateAlias(institucionTable, "ins", JoinType.LeftOuterJoin);

                projection.Add(Projections.Property("ins.Nombre"), "InstitucionNombre");
            }

            if (isInvestigador)
            {
                var coautorTable = EntityHelper.GetCoautorTable<T>();
                if (!String.IsNullOrEmpty(coautorTable))
                {
                    criteria
                        .CreateAlias(coautorTable, "co", JoinType.LeftOuterJoin)
                        .CreateAlias("co.Investigador", "i", JoinType.LeftOuterJoin)
                        .CreateAlias("i.Usuario", "iu", JoinType.LeftOuterJoin)
                        .Add(Expression.Or(Expression.Eq("u.Id", usuario.Id), Expression.Eq("iu.Id", usuario.Id)));
                }
                else
                    criteria.Add(Expression.Eq("u.Id", usuario.Id));
            }

            criteria.Add(Expression.Eq("f.Aceptacion1", 1));

            criteria.SetProjection(Projections.Distinct(projection))
                .AddOrder(Order.Desc("CreadoEl"))
                .SetResultTransformer(NHibernate.Transform.Transformers.AliasToBean(typeof(CurriculumDTO)));

            return criteria;
        }

        string GetPropertyName<TEntity>(Expression<Func<TEntity, object>> expression)
        {
            return GetPropertyInfo(expression).Member.Name;
        }

        MemberExpression GetPropertyInfo<TEntity>(Expression<Func<TEntity, object>> expression)
        {
            var memberExpression = expression.Body as MemberExpression;

            if (memberExpression == null)
            {
                UnaryExpression unaryExpression = expression.Body as UnaryExpression;
                if (unaryExpression != null && unaryExpression.NodeType == ExpressionType.Convert)
                    memberExpression = unaryExpression.Operand as MemberExpression;
            }

            if (memberExpression == null && memberExpression.Member.MemberType != MemberTypes.Property)
                throw new InvalidOperationException("Not a member access.");

            return memberExpression;
        }
    }
}
