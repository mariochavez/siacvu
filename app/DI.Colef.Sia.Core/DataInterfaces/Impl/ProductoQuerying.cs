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

namespace DecisionesInteligentes.Colef.Sia.Core.DataInterfaces
{
    public class ProductoQuerying : IProductoQuerying
    {
        protected virtual ISession Session
        {
            get
            {
                string factoryKey = SessionFactoryAttribute.GetKeyFrom(this);
                return NHibernateSession.CurrentFor(factoryKey);
            }
        }

        public T[] GetProductosByUsuario<T>(Usuario usuario, string coautorTableName)
        {
            var investigadorList = Session.CreateCriteria(typeof (Investigador))
                .CreateAlias("Usuario", "u")
                .Add(Expression.Eq("u.Id", usuario.Id))
                .List<Investigador>();

            var investigador = investigadorList.Count == 0 ? null : investigadorList[0];

            var productoList1 = Session.CreateCriteria(typeof (T))
                .CreateAlias("Usuario", "u")
                .Add(Expression.Eq("u.Id", usuario.Id))
                .Add(Expression.Eq("Activo", true))
                .List<T>();

            var productoList2 = Session.CreateCriteria(typeof (T))
                .CreateAlias(coautorTableName, "cia")
                .Add(Expression.Eq("cia.Investigador", investigador))
                .Add(Expression.Eq("Activo", true))
                .List<T>();

            var productoList = ((List<T>) productoList1);
            productoList.AddRange(productoList2);

            return productoList.ToArray();
        }

        public object[] GetBandejaProductos(Usuario usuario)
        {
            var bandejaTrabajo = new object[4];
            IMultiCriteria produccionAcademica = Session.CreateMultiCriteria()
                .Add(BuildCriteria<Articulo>(usuario, x => x.Titulo, x => x.TipoArticulo))
                .Add(BuildCriteria<Libro>(usuario, x => x.Nombre, x => x.ContenidoLibro))
                .Add(BuildCriteria<Capitulo>(usuario, x => x.NombreCapitulo, x => x.TipoCapitulo))
                .Add(BuildCriteria<ArticuloDifusion>(usuario, x => x.Titulo, x => x.TipoArticulo))
                .Add(BuildCriteria<Reporte>(usuario, x => x.Titulo, x => x.TipoReporte))
                .Add(BuildCriteria<Resena>(usuario, x => x.NombreProducto, x => x.TipoResena))
                .Add(BuildCriteria<ObraTraducida>(usuario, x => x.Nombre, x => x.TipoObraTraducida));

            IMultiCriteria formacionRecursosHumanos = Session.CreateMultiCriteria()
                .Add(BuildCriteria<Curso>(usuario, x => x.Nombre, x => x.TipoCurso));

            IMultiCriteria proyectos = Session.CreateMultiCriteria()
                .Add(BuildCriteria<Proyecto>(usuario, x => x.Nombre, x => x.TipoProyecto));

            IMultiCriteria vinculacionDifusion = Session.CreateMultiCriteria()
                .Add(BuildCriteria<Dictamen>(usuario, x => x.Nombre, x => x.TipoDictamen));

            var produccionAcademicaResultado = new List<ProductoDTO>();
            foreach (ArrayList producto in produccionAcademica.List())
            {
                produccionAcademicaResultado.AddRange(Enumerable.Cast<ProductoDTO>(producto));
            }

            var formacionRecursosHumanosResultado = new List<ProductoDTO>();
            foreach (ArrayList producto in formacionRecursosHumanos.List())
            {
                formacionRecursosHumanosResultado.AddRange(Enumerable.Cast<ProductoDTO>(producto));
            }

            var proyectosResultado = new List<ProductoDTO>();
            foreach (ArrayList producto in proyectos.List())
            {
                proyectosResultado.AddRange(Enumerable.Cast<ProductoDTO>(producto));
            }

            var vinculacionDifusionResultado = new List<ProductoDTO>();
            foreach (ArrayList producto in vinculacionDifusion.List())
            {
                vinculacionDifusionResultado.AddRange(Enumerable.Cast<ProductoDTO>(producto));
            }

            bandejaTrabajo[0] = produccionAcademicaResultado.ToArray();
            bandejaTrabajo[1] = formacionRecursosHumanosResultado.ToArray();
            bandejaTrabajo[2] = proyectosResultado.ToArray();
            bandejaTrabajo[3] = vinculacionDifusionResultado.ToArray();

            return bandejaTrabajo;
        }

        //public object[] GetBandejaProductos(Usuario usuario)
        //{
        //    return GetProductosBandeja(usuario, false, 0, 0);
        //}

        public object[] GetBandejaProductos(bool isDgaa)
        {
            return GetProductosBandeja(new Usuario(), isDgaa, 0, 0);
        }

        public object[] GetBandejaProductos(bool isDgaa, int filterId, int filterType)
        {
            return GetProductosBandeja(new Usuario(), isDgaa, filterId, filterType);
        }

        public object[] GetProductosBandeja(Usuario usuario, bool isDgaa, int filterId, int filterType)
        {
            var bandejaTrabajo = new object[4];

            //Produccion academica
            IMultiCriteria produccionAcademica = Session.CreateMultiCriteria()
                .Add(BuildCreteria<Articulo>(usuario.Id, "CoautorInternoArticulos", "Titulo", 1, true, true, isDgaa, filterId, filterType))
                .Add(BuildCreteria<ArticuloDifusion>(usuario.Id, "CoautorInternoArticulos", "Titulo", 16, true, true, isDgaa, filterId, filterType))
                .Add(BuildCreteria<Capitulo>(usuario.Id, "CoautorInternoCapitulos", "NombreCapitulo", 2, true, isDgaa, filterId, filterType))
                .Add(BuildCreteria<Libro>(usuario.Id, "CoautorInternoLibros", "Nombre", 7, true, isDgaa, filterId, filterType))
                .Add(BuildCreteria<Reporte>(usuario.Id, "CoautorInternoReportes", "Titulo", 11, true, isDgaa, filterId, filterType))
                .Add(BuildCreteria<Resena>(usuario.Id, "CoautorInternoResenas", "NombreProducto", 12, true, true, isDgaa, filterId, filterType))
                .Add(BuildCreteria<ObraTraducida>(usuario.Id, "CoautorInternoObraTraducidas", "Nombre", 20, true, isDgaa, filterId, filterType));

            //Proyectos
            IMultiCriteria proyectos = Session.CreateMultiCriteria()
                .Add(BuildCreteria<Proyecto>(usuario.Id, "", "Nombre", 15, "EstadoProyecto", isDgaa, filterId, filterType));

            //Formacion de recursos humanos
            IMultiCriteria formacionRecursosHumanos = Session.CreateMultiCriteria()
                .Add(BuildCreteria<Curso>(usuario.Id, "", "Nombre", 3, "TipoCurso", isDgaa, filterId, filterType))
                .Add(BuildCreteria<TesisDirigida>(usuario.Id, "", "Titulo", 13, "TipoTesis", isDgaa, filterId, filterType));

            //Actividades de vinculacion y difusion
            IMultiCriteria vinculacionDifusion = Session.CreateMultiCriteria()
                .Add(BuildCreteria<Dictamen>(usuario.Id, "", "Nombre", 4, "TipoDictamen", isDgaa, filterId, filterType))
                .Add(BuildCreteria<OrganoExterno>(usuario.Id, "", "Nombre", 8, "TipoOrgano", isDgaa, filterId, filterType))
                .Add(BuildCreteria<Evento>(usuario.Id, "", "Nombre", 6, "TipoEvento", isDgaa, filterId, filterType))
                .Add(BuildCreteria<ParticipacionMedio>(usuario.Id, "", "Titulo", 10, "TipoParticipacion", isDgaa, filterId, filterType));


            var produccionAcademicaResultado = new ArrayList();
            foreach (var producto in produccionAcademica.List())
            {
                produccionAcademicaResultado.AddRange((ICollection) producto);
            }

            var formacionRecursosHumanosResultado = new ArrayList();
            foreach (var producto in formacionRecursosHumanos.List())
            {
                formacionRecursosHumanosResultado.AddRange((ICollection)producto);
            }

            var proyectosResultado = new ArrayList();
            foreach (var producto in proyectos.List())
            {
                proyectosResultado.AddRange((ICollection)producto);
            }

            var vinculacionResultado = new ArrayList();
            foreach (var producto in vinculacionDifusion.List())
            {
                vinculacionResultado.AddRange((ICollection)producto);
            }

            bandejaTrabajo[0] = produccionAcademicaResultado;
            bandejaTrabajo[1] = formacionRecursosHumanosResultado;
            bandejaTrabajo[2] = proyectosResultado;
            bandejaTrabajo[3] = vinculacionResultado;

            return bandejaTrabajo;
        }

        ICriteria BuildCriteria<T>(Usuario usuario, Expression<Func<T, object>> productName,
            Expression<Func<T, object>> productType)
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
            if(!String.IsNullOrEmpty(estadoTable))
                projection.Add(Projections.Property(estadoTable), "Estatus");

            var tipoTable = String.Empty;
            if (productType != null)
            {
                if (GetPropertyType(productType) == typeof (int))
                    projection.Add(Projections.Property(GetPropertyName(productType)), "Tipo");
                else if (GetPropertyType(productType).BaseType == typeof(Entity))
                {
                    tipoTable = GetPropertyName(productType);
                    projection.Add(Projections.Property("t.Nombre"), "TipoNombre");
                }
            }

            var criteria = Session.CreateCriteria(typeof (T))
                .CreateAlias("Usuario", "u")
                .CreateAlias("Firma", "f");

            if (!String.IsNullOrEmpty(tipoTable))
                criteria.CreateAlias(tipoTable, "t");

            var isInvestigador = (from role in usuario.Roles
                          where role.Nombre == "Investigador"
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

            if(isInvestigador)
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

            //if (EntityHelper.GetTipoProducto<T>() == TipoProductoEnum.Curso || EntityHelper.GetTipoProducto<T>() == TipoProductoEnum.TesisDirigida)
            //    criteria.Add(Expression.Eq("Tipo", 2));

            criteria.SetProjection(Projections.Distinct(projection))
                .AddOrder(Order.Desc("CreadoEl"))
                .SetResultTransformer(NHibernate.Transform.Transformers.AliasToBean(typeof (ProductoDTO)));

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

        //Metodo de retorno para el resto de los productos
        private ICriteria BuildCreteria<T>(int usuarioId, string coautorTableName, string propertyName, int productType, string tipoPublicacion, bool isDgaa, int filterId, int filterType)
        {
            return BuildCreteria<T>(usuarioId, coautorTableName, propertyName, productType, tipoPublicacion, false, false, isDgaa, filterId, filterType);
        }

        //Metodo de retorno para producccion academica
        private ICriteria BuildCreteria<T>(int usuarioId, string coautorTableName, string propertyName, int productType, bool esProduccionAcademica, bool isDgaa, int filterId, int filterType)
        {
            return BuildCreteria<T>(usuarioId, coautorTableName, propertyName, productType, "", esProduccionAcademica, false, isDgaa, filterId, filterType);
        }

        //Metodo de retorno para Articulos y Resenas
        private ICriteria BuildCreteria<T>(int usuarioId, string coautorTableName, string propertyName, int productType, bool esProduccionAcademica, bool tieneRevista, bool isDgaa, int filterId, int filterType)
        {
            return BuildCreteria<T>(usuarioId, coautorTableName, propertyName, productType, "", esProduccionAcademica, tieneRevista, isDgaa, filterId, filterType);
        }

        private ICriteria BuildCreteria<T>(int usuarioId, string coautorTableName, string propertyName, int productType, string tipoPublicacion, bool esProduccionAcademica, bool tieneRevista, bool isDgaa, int filterId, int filterType)
        {

            var projection = Projections.ProjectionList()
                .Add(Projections.Property("Id"), "Id")
                .Add(Projections.Property(propertyName), "Nombre")
                .Add(Projections.Constant(productType), "TipoProducto")
                .Add(Projections.Property("Firma"), "Firma")
                .Add(Projections.Property("CreadoEl"), "CreadoEl")
                .Add(Projections.Property("Usuario"), "Usuario");

            if (esProduccionAcademica)
            {
                projection
                    .Add(Projections.Property("EstadoProducto"), "EstatusProducto")
                    .Add(Projections.GroupProperty(propertyName), "Nombre")
                    .Add(Projections.GroupProperty("Id"), "Id")
                    .Add(Projections.GroupProperty("CreadoEl"), "CreadoEl")
                    .Add(Projections.GroupProperty("EstadoProducto"), "EstatusProducto")
                    .Add(Projections.GroupProperty("Firma"), "Firma")
                    .Add(Projections.GroupProperty("Usuario"), "Usuario");
            }

            if (tieneRevista)
            {
                projection
                    .Add(Projections.Property("RevistaPublicacion"), "RevistaPublicacion")
                    .Add(Projections.GroupProperty("RevistaPublicacion"), "RevistaPublicacion");
            }

            if (productType == 3 || productType == 13)
                projection.Add(Projections.Property("Institucion"), "Institucion");

            if (productType == 15)
                projection.Add(Projections.Property(tipoPublicacion), "EstatusProducto");

            if(productType == 4)
                projection.Add(Projections.Property(tipoPublicacion), "TipoDictamen");

            if (productType == 8)
                projection.Add(Projections.Property(tipoPublicacion), "TipoOrgano");

            if (productType == 6)
                projection.Add(Projections.Property(tipoPublicacion), "TipoEvento");

            if (productType == 10)
                projection.Add(Projections.Property(tipoPublicacion), "TipoParticipacion");

            var criteria = Session.CreateCriteria(typeof (T));

            if (!isDgaa)
            {
                criteria.CreateAlias("Usuario", "u");

                if (coautorTableName != "")
                {
                    criteria
                        .CreateAlias(coautorTableName, "co", JoinType.LeftOuterJoin)
                        .CreateAlias("co.Investigador", "i", JoinType.LeftOuterJoin)
                        .CreateAlias("i.Usuario", "iu", JoinType.LeftOuterJoin)
                        .Add(Expression.Or(Expression.Eq("u.Id", usuarioId), Expression.Eq("iu.Id", usuarioId)));
                }
                else
                    criteria.Add(Expression.Eq("u.Id", usuarioId));
            }

            if(filterType == 1)
            {
                criteria.CreateAlias("Usuario", "u")
                    .Add(Expression.Eq("u.Id", filterId));
            }

            if (filterType == 2)
            {
                criteria.CreateAlias("Departamento", "d")
                    .Add(Expression.Eq("d.Id", filterId));
            }

            criteria.SetProjection(projection)
                .AddOrder(Order.Desc("CreadoEl"))
                .SetResultTransformer(NHibernate.Transform.Transformers.AliasToBean(typeof (ProductoDTO)));

            if (productType == 3 || productType == 13)
            {
                var cursosTesis = DetachedCriteria.For(typeof (T))
                    .SetProjection(Projections.ProjectionList()
                                       .Add(Projections.Property(tipoPublicacion), "TipoPublicacion"))
                    .Add(Expression.Eq(tipoPublicacion, 2));

                criteria.Add(Subqueries.PropertyIn(tipoPublicacion, cursosTesis));
            }

            var productoAceptado = DetachedCriteria.For(typeof(Firma))
                .SetProjection(Projections.ProjectionList()
                                   .Add(Projections.Property("Id"), "Aceptacion2"))
                .Add(Expression.Eq("Aceptacion2", 1));

            criteria.Add(Subqueries.PropertyNotIn("Firma", productoAceptado));

            if(isDgaa)
            {
                var productoEnFirma = DetachedCriteria.For(typeof (Firma))
                    .SetProjection(Projections.ProjectionList()
                                       .Add(Projections.Property("Id"), "Aceptacion1"))
                    .Add(Expression.Eq("Aceptacion1", 1));

                criteria.Add(Subqueries.PropertyIn("Firma", productoEnFirma));
            }

            return criteria;
        }
    }
}