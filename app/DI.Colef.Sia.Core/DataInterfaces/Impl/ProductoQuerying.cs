using System;
using System.Collections;
using System.Collections.Generic;
using NHibernate;
using NHibernate.Criterion;
using NHibernate.SqlCommand;
using SharpArch.Data.NHibernate;

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

        public object[] GetProductosBandeja(Usuario usuario)
        {
            var bandejaTrabajo = new object[4];

            //Produccion academica
            IMultiCriteria produccionAcademica = Session.CreateMultiCriteria()
                .Add(BuildCreteria<Articulo>(usuario.Id, "CoautorInternoArticulos", "Titulo", 1, true, true))
                .Add(BuildCreteria<Capitulo>(usuario.Id, "CoautorInternoCapitulos", "NombreCapitulo", 2, true))
                .Add(BuildCreteria<Libro>(usuario.Id, "CoautorInternoLibros", "Nombre", 7, true))
                .Add(BuildCreteria<Reporte>(usuario.Id, "CoautorInternoReportes", "Titulo", 11, true))
                .Add(BuildCreteria<Resena>(usuario.Id, "CoautorInternoResenas", "NombreProducto", 12, true, true));

            //Proyectos
            IMultiCriteria proyectos = Session.CreateMultiCriteria()
                .Add(BuildCreteria<Proyecto>(usuario.Id, "", "Nombre", 14, "EstadoProyecto"));

            //Formacion de recursos humanos
            IMultiCriteria formacionRecursosHumanos = Session.CreateMultiCriteria()
                .Add(BuildCreteria<Curso>(usuario.Id, "", "Nombre", 3, "TipoCurso"))
                .Add(BuildCreteria<TesisDirigida>(usuario.Id, "", "Titulo", 13, "TipoTesis"));

            //Actividades de vinculacion y difusion
            IMultiCriteria vinculacionDifusion = Session.CreateMultiCriteria()
                .Add(BuildCreteria<Dictamen>(usuario.Id, "", "Nombre", 4, "TipoDictamen"))
                .Add(BuildCreteria<OrganoExterno>(usuario.Id, "", "Nombre", 8, "TipoOrgano"))
                .Add(BuildCreteria<Evento>(usuario.Id, "", "Nombre", 6, "TipoEvento"))
                .Add(BuildCreteria<ParticipacionMedio>(usuario.Id, "", "Titulo", 10, "TipoParticipacion"));


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

        //Metodo de retorno para Curso y Tesis
        private ICriteria BuildCreteria<T>(int usuarioId, string coautorTableName, string propertyName, int productType, string tipoPublicacion)
        {
            return BuildCreteria<T>(usuarioId, coautorTableName, propertyName, productType, tipoPublicacion, false, false);
        }

        //Metodo de retorno para producccion academica
        private ICriteria BuildCreteria<T>(int usuarioId, string coautorTableName, string propertyName, int productType, bool esProduccionAcademica)
        {
            return BuildCreteria<T>(usuarioId, coautorTableName, propertyName, productType, "", esProduccionAcademica, false);
        }

        //Metodo de retorno para Articulos y Resenas
        private ICriteria BuildCreteria<T>(int usuarioId, string coautorTableName, string propertyName, int productType, bool esProduccionAcademica, bool tieneRevista)
        {
            return BuildCreteria<T>(usuarioId, coautorTableName, propertyName, productType, "", esProduccionAcademica, tieneRevista);
        }

        private ICriteria BuildCreteria<T>(int usuarioId, string coautorTableName, string propertyName, int productType, string tipoPublicacion, bool esProduccionAcademica, bool tieneRevista)
        {
            var projection = Projections.ProjectionList()
                .Add(Projections.Property("Id"), "Id")
                .Add(Projections.Property(propertyName), "Nombre")
                .Add(Projections.Constant(productType), "TipoProducto")
                .Add(Projections.Property("CreadoEl"), "CreadoEl");

            if (esProduccionAcademica)
            {
                projection
                    .Add(Projections.Property("EstadoProducto"), "EstatusProducto")
                    .Add(Projections.GroupProperty(propertyName), "Nombre")
                    .Add(Projections.GroupProperty("Id"), "Id")
                    .Add(Projections.GroupProperty("CreadoEl"), "CreadoEl")
                    .Add(Projections.GroupProperty("EstadoProducto"), "EstatusProducto");
            }

            if (tieneRevista)
            {
                projection
                    .Add(Projections.Property("RevistaPublicacion"), "RevistaPublicacion")
                    .Add(Projections.GroupProperty("RevistaPublicacion"), "RevistaPublicacion");
            }

            if (productType == 3 || productType == 13)
                projection.Add(Projections.Property("Institucion"), "Institucion");

            if (productType == 14)
                projection.Add(Projections.Property(tipoPublicacion), "EstatusProducto");

            if(productType == 4)
                projection.Add(Projections.Property(tipoPublicacion), "TipoDictamen");

            if (productType == 8)
                projection.Add(Projections.Property(tipoPublicacion), "TipoOrgano");

            if (productType == 6)
                projection.Add(Projections.Property(tipoPublicacion), "TipoEvento");

            if (productType == 10)
                projection.Add(Projections.Property(tipoPublicacion), "TipoParticipacion");

            var criteria = Session.CreateCriteria(typeof (T))
                .CreateAlias("Usuario", "u")
                .SetProjection(projection)
                .AddOrder(Order.Desc("CreadoEl"))
                .SetResultTransformer(NHibernate.Transform.Transformers.AliasToBean(typeof (ProductoDTO)));

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

            if (productType == 3 || productType == 13)
            {
                var cursosTesis = DetachedCriteria.For(typeof (T))
                    .SetProjection(Projections.ProjectionList()
                                       .Add(Projections.Property(tipoPublicacion), "TipoPublicacion"))
                    .Add(Expression.Eq(tipoPublicacion, 2));

                criteria.Add(Subqueries.PropertyIn(tipoPublicacion, cursosTesis));
            }

            //Filtrar todos los productos que mientras Aceptacion2 no tenga valor de 2
            //Unicamente probado en articulos
            //if (productType == 1)
            //{
                var firma = DetachedCriteria.For(typeof (Firma))
                    .SetProjection(Projections.ProjectionList()
                                       .Add(Projections.Property("Aceptacion2"), "Aceptacion2"))
                    .Add(Expression.Eq("Aceptacion2", 2));

                criteria.Add(Subqueries.PropertyNotIn("Firma", firma));
            //}

            return criteria;
        }
    }

    public class ProductoDTO
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public int TipoProducto { get; set; }
        public DateTime CreadoEl { get; set; }
        public int TipoPublicacion { get; set; }
        public int EstatusProducto { get; set; }
        public RevistaPublicacion RevistaPublicacion { get; set; }
        public Institucion Institucion { get; set; }
        public TipoDictamen TipoDictamen { get; set; }
        public TipoOrgano TipoOrgano { get; set; }
        public TipoEvento TipoEvento { get; set; }
        public TipoParticipacion TipoParticipacion { get; set; }
        public int Aceptacion2 { get; set; }
    }
}