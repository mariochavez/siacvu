using System;
using System.Web.Mvc;
using System.Web.Mvc.Html;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers
{
    public static class ProductoHelper
    {
        public static string SievaPuntos(this HtmlHelper html)
        {
            var sessionData = html.ViewContext.HttpContext.Session["puntos"];
            var puntos = sessionData != null ? (decimal) sessionData : 0;
            return String.Format("Puntos SIEVA: {0}", puntos);
        }

        public static string ProductoInformation(this HtmlHelper html, ProductoDTO producto)
        {
            var info = String.Empty;

            info += String.Format("{0} {1}", HumanizeHelper.GetNombreProducto(producto.TipoProducto),
                                  !String.IsNullOrEmpty(producto.TipoNombre) ? "" + producto.TipoNombre : String.Empty);

            if (!String.IsNullOrEmpty(producto.RevistaNombre))
                info += String.Format("<br />publicado en {0}", producto.RevistaNombre);

            if (producto.Estatus != 0)
                info += String.Format("<br />se encuentra {0}",
                                      HumanizeHelper.EstadoProducto(producto.Estatus).ToLower());

            if (producto.IsRejected())
                info += String.Format("<br />trabajo rechazado de validación");
            else if (!producto.IsFirmed() && !producto.IsValidated())
                info += String.Format("<br /><span>aún sin firmar, trabajo en proceso</span>");
            else if(producto.IsFirmed() && !producto.IsValidated())
                info += String.Format("<br />trabajo firmado en proceso de validación");
            else if(producto.IsValidated())
            	info += String.Format("<br />trabajo firmado y validado");

            info += String.Format("<br />registrado el {0}", producto.FechaCreacion);

            return info;
        }

        public static string ProductActions(this HtmlHelper html, ProductoDTO producto, bool isDGAA)
        {
            var actions = String.Empty;
            
            if ((isDGAA && producto.IsFirmed()) || (!isDGAA && producto.IsValidated()))
                actions += String.Format("<span>{0}</span>",
                                         html.ActionLink("Editar", "Edit", "Home", 
                                         	new { id= producto.Id, tipoProducto = producto.TipoProducto }, null));
            else if (!isDGAA)
            {
                if (!producto.IsFirmed() && !producto.IsValidated() && producto.UsuarioId == producto.CurrentUserId)
                {
                    actions += String.Format("<span>{0}</span>",
                                         html.ActionLink("Editar", "Edit", "Home", 
                                         	new { id= producto.Id, tipoProducto = producto.TipoProducto }, null));

                    actions += String.Format("<span>{0}</span>",
                                         html.ActionLink("Firmar", "Sign", "Home", 
                                         	new { id= producto.Id, tipoProducto = producto.TipoProducto }, new { @class = "remote put"}));
                } 
                else if (producto.IsFirmed() && !producto.IsValidated() || producto.UsuarioId != producto.CurrentUserId)
                {
                    actions += String.Format("<span>{0}</span>",
                                         html.ActionLink("Ver", "Show", "Home", 
                                         	new { id= producto.Id, tipoProducto = producto.TipoProducto }, null));
                }
            }
            return actions;
        }

        public static string CollapsePanelClass(this HtmlHelper html, int elements)
        {
            return elements == 0 ? "collapsed" : String.Empty;
        }

        public static string ProductoListTitle(this HtmlHelper html, TipoProductoEnum tipoProducto)
		{
		    string productoListTitle = "Administración de {0}";

            if (tipoProducto == TipoProductoEnum.ParticipacionMedio)
                productoListTitle = "Administración de actividades de {0}";
			
			return String.Format(productoListTitle, ProductoNamePlural(html, tipoProducto));
		}

        public static string ProductoNewTitle(this HtmlHelper html, TipoProductoEnum tipoProducto)
        {
            string productoNewTitle = "Registrar {0}";

            if (tipoProducto == TipoProductoEnum.ParticipacionMedio)
                productoNewTitle = "Registrar actividad de {0}";

            return String.Format(productoNewTitle, ProductoNameSingular(html, tipoProducto));
        }

        public static string ProductoEditTitle(this HtmlHelper html, TipoProductoEnum tipoProducto)
        {
            string productoEditTitle = "Modificar{0} {1}";

            if (tipoProducto == TipoProductoEnum.ParticipacionMedio)
                productoEditTitle = "Modificar actividad de{0} {1}";

            return String.Format(productoEditTitle, null, ProductoNameSingular(html, tipoProducto));
        }

        public static string ProductoShowTitle(this HtmlHelper html, TipoProductoEnum tipoProducto)
        {
            string productoShowTitle = "Consulta de{0} {1}";

            if (tipoProducto == TipoProductoEnum.ParticipacionMedio) productoShowTitle = "Consulta de actividad de{0}";

            return String.Format(productoShowTitle, null, ProductoNameSingular(html, tipoProducto));
        }

        public static string ProductoListSubTitle(this HtmlHelper html, TipoProductoEnum tipoProducto)
        {
            string productoListSubTitle = "Registrar {0}";

            if (tipoProducto == TipoProductoEnum.ParticipacionMedio) productoListSubTitle = "Registrar actividad de {0}";

            return String.Format(productoListSubTitle, ProductoNameSingular(html, tipoProducto));
        }

        public static string ProductoEditMessage(this HtmlHelper html, TipoProductoEnum tipoProducto)
        {
            string productoEditMessage = "Para modificar{0} {1} utilice los siguientes campos para realizar cambios dentro del sistema.";

            return String.Format(productoEditMessage, GetArticuloDefinidoIdioma(tipoProducto),
                                 ProductoNameSingular(html, tipoProducto));
        }

        public static string ProductoListMessage(this HtmlHelper html, TipoProductoEnum tipoProducto)
        {
            string productoListMessage = "Puede registrar{0} {1}, presionando en el botón de título + Nuevo.";

            return String.Format(productoListMessage, GetArticuloIndefinidoIdioma(tipoProducto), ProductoNameSingular(html, tipoProducto));
        }

        public static string ProductoNewMessage(this HtmlHelper html, TipoProductoEnum tipoProducto)
        {
            string productoNewMessage = "Favor de llenar los siguientes campos para registrar{0}{1} {2} dentro del sistema. ";

            if (tipoProducto == TipoProductoEnum.ParticipacionMedio)
            {
                productoNewMessage = "Favor de llenar los siguientes campos para registrar{0} {1} dentro del sistema. ";
                return String.Format(productoNewMessage, GetArticuloIndefinidoIdioma(tipoProducto),
                                                 ProductoNameSingular(html, tipoProducto));
            }
            return String.Format(productoNewMessage, GetArticuloIndefinidoIdioma(tipoProducto),
                                 GetProductoNewGenderText(tipoProducto),
                                 ProductoNameSingular(html, tipoProducto));
        }

        public static string ProductoShowMessage(this HtmlHelper html, TipoProductoEnum tipoProducto)
        {
            string productoShowMessage = "Aquí se muestra la información detallada de{0} {1} como está en el sistema.";
            string articulo = GetArticuloDefinidoIdioma(tipoProducto);
            if (articulo == " el") articulo = "l";
            return String.Format(productoShowMessage,articulo,
                                 ProductoNameSingular(html, tipoProducto));
        }

        public static string ProductoNameSingular(this HtmlHelper html, TipoProductoEnum tipoProducto)
        {
            return ProductoNameSingular(tipoProducto);
        }

        public static string ProductoNameSingular(TipoProductoEnum tipoProducto)
        {
            string productName = String.Empty;
            switch (tipoProducto)
            {
                case TipoProductoEnum.Articulo:
                    productName = "Artículo en revista de investigación";
                    break;
                case TipoProductoEnum.ArticuloDifusion:
                    productName = "Artículo en revista de divulgación";
                    break;
                case TipoProductoEnum.Capitulo:
                    productName = "Capítulo en libro";
                    break;
                case TipoProductoEnum.Curso:
                    productName = "Curso";
                    break;
                case TipoProductoEnum.Dictamen:
                    productName = "Dictamen";
                    break;
                case TipoProductoEnum.Evento:
                    productName = "Organización y participación de evento académico";
                    break;
                case TipoProductoEnum.Libro:
                    productName = "Libro";
                    break;
                case TipoProductoEnum.ObraTraducida:
                    productName = "Obra traducida";
                    break;
                case TipoProductoEnum.OrganoExterno:
                    productName = "Participación Honorífica en Órganos Colegiados Externos";
                    break;
                case TipoProductoEnum.ParticipacionMedio:
                    productName = "Difusión del conocimiento";
                    break;
                case TipoProductoEnum.Reporte:
                    productName = "Reporte técnico/Documento de trabajo";
                    break;
                case TipoProductoEnum.TesisDirigida:
                    productName = "Participación en Tesis";
                    break;
                case TipoProductoEnum.Resena:
                    productName = "Reseña/Nota crítica";
                    break;
                case TipoProductoEnum.OrganoInterno:
                    productName = "Participación en órgano Interno";
                    break;
                case TipoProductoEnum.Distincion:
                    productName = "Distinción académica";
                    break;
                case TipoProductoEnum.ExperienciaProfesional:
                    productName = "Experiencia Profesional";
                    break;
                case TipoProductoEnum.ApoyoConacyt:
                    productName = "Apoyo CONACYT";
                    break;
                case TipoProductoEnum.GrupoInvestigacion:
                    productName = "Grupo de investigación";
                    break;
            }

            return productName;
        }

        public static string ProductoNamePlural(this HtmlHelper html, TipoProductoEnum tipoProducto)
        {
            string productName = string.Empty;

            switch (tipoProducto)
            {
                case TipoProductoEnum.Articulo:
                    productName = "Artículos en revistas de investigación";
                    break;
                case TipoProductoEnum.ArticuloDifusion:
                    productName = "Artículos en revistas de divulgación";
                    break;
                case TipoProductoEnum.Capitulo:
                    productName = "Capítulos en libros";
                    break;
                case TipoProductoEnum.Curso:
                    productName = "Cursos";
                    break;
                case TipoProductoEnum.Dictamen:
                    productName = "Dictámenes";
                    break;
                case TipoProductoEnum.Evento:
                    //productName = "Organización y participación de eventos académicos";
                    productName = "Participación en eventos académicos";
                    break;
                case TipoProductoEnum.Libro:
                    productName = "Libros";
                    break;
                case TipoProductoEnum.ObraTraducida:
                    productName = "Obras traducidas";
                    break;
                case TipoProductoEnum.OrganoExterno:
                    //productName = "Participaciónes Honoríficas en Órganos Colegiados Externos";
                    productName = "Órganos colegiados externos";
                    break;
                case TipoProductoEnum.ParticipacionMedio:
                    productName = "Difusión del conocimiento";
                    break;
                case TipoProductoEnum.Reporte:
                    //productName = "Reportes técnicos/Documentos de trabajo";
                    productName = "Reportes técnicos";
                    break;
                case TipoProductoEnum.TesisDirigida:
                    productName = "Participación en tesis";
                    break;
				case TipoProductoEnum.Resena:
                    productName = "Reseñas/Notas críticas";
                    break;
                case TipoProductoEnum.OrganoInterno:
                    productName = "Participaciones en órganos internos";
                    break;
                case TipoProductoEnum.Distincion:
                    productName = "Distinciones académicas";
                    break;
                case TipoProductoEnum.ExperienciaProfesional:
                    productName = "Experiencia profesional";
                    break;
                case TipoProductoEnum.ApoyoConacyt:
                    productName = "Apoyos CONACYT";
                    break;
                case TipoProductoEnum.GrupoInvestigacion:
                    productName = "Grupos de investigación";
                    break;
            }

            return productName;
        }

        static string GetArticuloDefinidoIdioma(TipoProductoEnum tipoProducto)
        {
            string articuloIdioma = " el";
            if (tipoProducto == TipoProductoEnum.ObraTraducida || tipoProducto == TipoProductoEnum.ParticipacionMedio
                || tipoProducto == TipoProductoEnum.TesisDirigida || tipoProducto == TipoProductoEnum.Resena
                || tipoProducto == TipoProductoEnum.Distincion || tipoProducto == TipoProductoEnum.ExperienciaProfesional)
                articuloIdioma = " la";

            if (tipoProducto == TipoProductoEnum.ParticipacionMedio) articuloIdioma += " actividad de";
            return articuloIdioma;
        }

        static string GetArticuloIndefinidoIdioma(TipoProductoEnum tipoProducto)
        {
            string articuloIndefinidoIdioma = " un";
            if (tipoProducto == TipoProductoEnum.ObraTraducida || tipoProducto == TipoProductoEnum.ParticipacionMedio 
                || tipoProducto == TipoProductoEnum.TesisDirigida || tipoProducto == TipoProductoEnum.Resena ||
                tipoProducto == TipoProductoEnum.ExperienciaProfesional)
                articuloIndefinidoIdioma = " una";
            if (tipoProducto == TipoProductoEnum.ParticipacionMedio) articuloIndefinidoIdioma += " actividad de";
            return articuloIndefinidoIdioma;
        }

        static string GetProductoNewGenderText(TipoProductoEnum tipoProducto)
        {
            string generoNuevo = " nuevo";
            if (tipoProducto == TipoProductoEnum.ObraTraducida || tipoProducto == TipoProductoEnum.ParticipacionMedio
                || tipoProducto == TipoProductoEnum.TesisDirigida || tipoProducto == TipoProductoEnum.Resena
                || tipoProducto == TipoProductoEnum.ExperienciaProfesional) generoNuevo = " nueva";
            return generoNuevo;
        }
    }
}