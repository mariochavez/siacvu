using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using NHibernate;
using NHibernate.Criterion;
using NHibernate.SqlCommand;
using SharpArch.Core.DomainModel;
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
                .Add(BuildCriteria<Articulo>(usuario, x => x.Titulo, x => x.TipoArticulo).FilterBandeja())
                .Add(BuildCriteria<Libro>(usuario, x => x.Nombre, x => x.ContenidoLibro).FilterBandeja())
                .Add(BuildCriteria<Capitulo>(usuario, x => x.NombreCapitulo, x => x.TipoCapitulo).FilterBandeja())
                .Add(BuildCriteria<ArticuloDifusion>(usuario, x => x.Titulo, x => x.TipoArticulo).FilterBandeja())
                .Add(BuildCriteria<Reporte>(usuario, x => x.Titulo, x => x.TipoReporte).FilterBandeja())
                .Add(BuildCriteria<Resena>(usuario, x => x.NombreProducto, x => x.TipoResena).FilterBandeja())
                .Add(BuildCriteria<ObraTraducida>(usuario, x => x.Nombre, x => x.TipoObraTraducida).FilterBandeja());

            IMultiCriteria formacionRecursosHumanos = Session.CreateMultiCriteria()
                .Add(BuildCriteria<Curso>(usuario, x => x.Nombre, x => x.TipoCurso).FilterBandeja())
                .Add(BuildCriteria<TesisDirigida>(usuario, x => x.Titulo, x => x.TipoTesis).FilterBandeja());

            IMultiCriteria proyectos = Session.CreateMultiCriteria()
                .Add(BuildCriteria<Proyecto>(usuario, x => x.Nombre, x => x.TipoProyecto).FilterBandeja());

            IMultiCriteria vinculacionDifusion = Session.CreateMultiCriteria()
                .Add(BuildCriteria<Dictamen>(usuario, x => x.Nombre, x => x.TipoDictamen).FilterBandeja())
                .Add(BuildCriteria<OrganoExterno>(usuario, x => x.Nombre, x => x.TipoOrgano).FilterBandeja())
                .Add(BuildCriteria<ParticipacionMedio>(usuario, x => x.Titulo, x => x.TipoParticipacion).FilterBandeja());

            IMultiCriteria eventos = Session.CreateMultiCriteria()
                .Add(BuildCriteria<Evento>(usuario, x => x.Nombre, x => x.TipoEvento).FilterBandeja());

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

        ICriteria BuildCriteria<T>(Usuario usuario, Expression<Func<T, object>> productName, Expression<Func<T, object>> productType)
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

            var estadoTable = EntityHelper.GetEstadoTable<T>();
            if (!String.IsNullOrEmpty(estadoTable))
                projection.Add(Projections.Property(estadoTable), "Estatus");

            var tipoTable = String.Empty;
            if (productType != null)
            {
                if (GetPropertyType(productType) == typeof(int))
                    projection.Add(Projections.Property(GetPropertyName(productType)), "Tipo");
                else if (GetPropertyType(productType).BaseType == typeof(Entity))
                {
                    tipoTable = GetPropertyName(productType);
                    projection.Add(Projections.Property("t.Nombre"), "TipoNombre");
                }
            }

            var criteria = Session.CreateCriteria(typeof(T))
                .CreateAlias("Usuario", "u")
                .CreateAlias("Firma", "f");

            if (!String.IsNullOrEmpty(tipoTable))
                criteria.CreateAlias(tipoTable, "t");

            var isInvestigador = (from role in usuario.Roles
                                  where role.Nombre == "Investigadores"
                                  select role).FirstOrDefault() != null;

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

            criteria.SetProjection(Projections.Distinct(projection))
                .AddOrder(Order.Desc("CreadoEl"))
                .SetResultTransformer(NHibernate.Transform.Transformers.AliasToBean(typeof(CurriculumDTO)));

            return criteria;
        }

        string GetPropertyName<TEntity>(Expression<Func<TEntity, object>> expression)
        {
            return GetPropertyInfo(expression).Member.Name;
        }

        Type GetPropertyType<TEntity>(Expression<Func<TEntity, object>> expression)
        {
            return GetPropertyInfo(expression).Type;
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

    public static class CriteriaFilters
    {
        public static ICriteria FilterBandeja(this ICriteria criteria)
        {
            criteria.Add(Expression.Eq("f.Aceptacion2", 1));

            return criteria;
        }
    }
}
