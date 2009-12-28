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
            return GetProductosBandeja(usuario, false);
        }

        public object[] GetProductosBandeja(bool isDgaa)
        {
            return GetProductosBandeja(new Usuario(), isDgaa);
        }

        public object[] GetProductosBandeja(Usuario usuario, bool isDgaa)
        {
            var bandejaTrabajo = new object[4];

            //Produccion academica
            IMultiCriteria produccionAcademica = Session.CreateMultiCriteria()
                .Add(BuildCreteria<Articulo>(usuario.Id, "CoautorInternoArticulos", "Titulo", 1, true, true, isDgaa))
                .Add(BuildCreteria<ArticuloDifusion>(usuario.Id, "CoautorInternoArticulos", "Titulo", 16, true, true, isDgaa))
                .Add(BuildCreteria<Capitulo>(usuario.Id, "CoautorInternoCapitulos", "NombreCapitulo", 2, true, isDgaa))
                .Add(BuildCreteria<Libro>(usuario.Id, "CoautorInternoLibros", "Nombre", 7, true, isDgaa))
                .Add(BuildCreteria<Reporte>(usuario.Id, "CoautorInternoReportes", "Titulo", 11, true, isDgaa))
                .Add(BuildCreteria<Resena>(usuario.Id, "CoautorInternoResenas", "NombreProducto", 12, true, true, isDgaa))
                .Add(BuildCreteria<ObraTraducida>(usuario.Id, "CoautorInternoObraTraducidas", "Nombre", 20, true, isDgaa));

            //Proyectos
            IMultiCriteria proyectos = Session.CreateMultiCriteria()
                .Add(BuildCreteria<Proyecto>(usuario.Id, "", "Nombre", 15, "EstadoProyecto", isDgaa));

            //Formacion de recursos humanos
            IMultiCriteria formacionRecursosHumanos = Session.CreateMultiCriteria()
                .Add(BuildCreteria<Curso>(usuario.Id, "", "Nombre", 3, "TipoCurso", isDgaa))
                .Add(BuildCreteria<TesisDirigida>(usuario.Id, "", "Titulo", 13, "TipoTesis", isDgaa));

            //Actividades de vinculacion y difusion
            IMultiCriteria vinculacionDifusion = Session.CreateMultiCriteria()
                .Add(BuildCreteria<Dictamen>(usuario.Id, "", "Nombre", 4, "TipoDictamen", isDgaa))
                .Add(BuildCreteria<OrganoExterno>(usuario.Id, "", "Nombre", 8, "TipoOrgano", isDgaa))
                .Add(BuildCreteria<Evento>(usuario.Id, "", "Nombre", 6, "TipoEvento", isDgaa))
                .Add(BuildCreteria<ParticipacionMedio>(usuario.Id, "", "Titulo", 10, "TipoParticipacion", isDgaa));


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

        //Metodo de retorno para el resto de los productos
        private ICriteria BuildCreteria<T>(int usuarioId, string coautorTableName, string propertyName, int productType, string tipoPublicacion, bool isDgaa)
        {
            return BuildCreteria<T>(usuarioId, coautorTableName, propertyName, productType, tipoPublicacion, false, false, isDgaa);
        }

        //Metodo de retorno para producccion academica
        private ICriteria BuildCreteria<T>(int usuarioId, string coautorTableName, string propertyName, int productType, bool esProduccionAcademica, bool isDgaa)
        {
            return BuildCreteria<T>(usuarioId, coautorTableName, propertyName, productType, "", esProduccionAcademica, false, isDgaa);
        }

        //Metodo de retorno para Articulos y Resenas
        private ICriteria BuildCreteria<T>(int usuarioId, string coautorTableName, string propertyName, int productType, bool esProduccionAcademica, bool tieneRevista, bool isDgaa)
        {
            return BuildCreteria<T>(usuarioId, coautorTableName, propertyName, productType, "", esProduccionAcademica, tieneRevista, isDgaa);
        }

        private ICriteria BuildCreteria<T>(int usuarioId, string coautorTableName, string propertyName, int productType, string tipoPublicacion, bool esProduccionAcademica, bool tieneRevista, bool isDgaa)
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
        public Firma Firma { get; set; }
        public Usuario Usuario { get; set; }
        public int Aceptacion2 { get; set; }
        public int Aceptacion1 { get; set; }
        public int GuidNumber { get; set; }

        public string InvestigadorNombre
        {
            get
            {
                return string.Format("{0} {1} {2}", Usuario.ApellidoPaterno, Usuario.ApellidoMaterno, Usuario.Nombre);
            }
        }
    }
}