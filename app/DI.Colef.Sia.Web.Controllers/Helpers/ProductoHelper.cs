using System;
using System.Web.Mvc;
using System.Web.Mvc.Html;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;
using SharpArch.Web.Areas;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers
{
    public static class ProductoHelper
    {
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

            info += String.Format("<br />registrado el {0}", producto.FechaCreacion);

            return info;
        }

        public static string ProductActions(this HtmlHelper html, ProductoDTO producto, bool isDGAA)
        {
            var actions = String.Empty;

            if ((isDGAA && producto.IsFirmed()) || (!isDGAA && producto.IsValidated()))
                actions += String.Format("<span>{0}</span>",
                                         html.ActionLink("Editar", "Edit",
                                                         new
                                                             {
                                                                 producto.Id,
                                                                 producto.TipoProducto
                                                             }));
            else if (!isDGAA)
            {
                if (!producto.IsFirmed() && !producto.IsValidated())
                {
                    actions += String.Format("<span>{0}</span>",
                                             html.ActionLink("Editar", "Edit",
                                                             new
                                                                 {
                                                                     producto.Id,
                                                                     producto.TipoProducto
                                                                 }));
                    actions += String.Format("<span>{0}</span>",
                                             html.ActionLink("Firmar", "Sign",
                                                             new
                                                                 {
                                                                     producto.Id,
                                                                     producto.TipoProducto
                                                                 },
                                                             new { @class = "remote put" })
                        );
                }
                else if (producto.IsFirmed() && !producto.IsValidated())
                    actions += String.Format("<span>{0}</span>",
                                             html.ActionLink("Ver", "Show",
                                                             new
                                                                 {
                                                                     producto.Id,
                                                                     producto.TipoProducto
                                                                 }));

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
			
			return String.Format(productoListTitle, ProductoNamePlural(html, tipoProducto));
		}

        public static string ProductoNewTitle(this HtmlHelper html, TipoProductoEnum tipoProducto)
        {
            string productoNewTitle = "Registrar {0}";

            return String.Format(productoNewTitle, ProductoNameSingular(html, tipoProducto));
        }

        public static string ProductoEditTitle(this HtmlHelper html, TipoProductoEnum tipoProducto)
        {
            string productoEditTitle = "Modificar{0} {1}";

            return String.Format(productoEditTitle, null, ProductoNameSingular(html, tipoProducto));
        }

        public static string ProductoShowTitle(this HtmlHelper html, TipoProductoEnum tipoProducto)
        {
            string productoShowTitle = "Consulta de{0} {1}";

            return String.Format(productoShowTitle, null, ProductoNameSingular(html, tipoProducto));
        }

        public static string ProductoListSubTitle(this HtmlHelper html, TipoProductoEnum tipoProducto)
        {
            string productoListSubTitle = "Agregar {0}";

            return String.Format(productoListSubTitle, ProductoNamePlural(html, tipoProducto));
        }

        public static string ProductoEditMessage(this HtmlHelper html, TipoProductoEnum tipoProducto)
        {
            string productoEditMessage = "Para modificar{0} {1} utilice los siguientes campos para realizar cambios dentro del sistema.";

            return String.Format(productoEditMessage, GetArticuloDefinidoIdioma(tipoProducto),
                                 ProductoNameSingular(html, tipoProducto));
        }

        public static string ProductoListMessage(this HtmlHelper html, TipoProductoEnum tipoProducto)
        {
            string productoListMessage = "Puede agregar{0} {1}, presionando en el botón de título + Nuevo.";

            return String.Format(productoListMessage, GetArticuloIndefinidoIdioma(tipoProducto), ProductoNameSingular(html, tipoProducto));
        }

        public static string ProductoNewMessage(this HtmlHelper html, TipoProductoEnum tipoProducto)
        {
            string productoNewMessage = "Favor de llenar los siguientes campos para registrar{0}{1} {2} dentro del sistema. ";

            return String.Format(productoNewMessage, GetArticuloIndefinidoIdioma(tipoProducto),
                                 GetProductoNewGenderText(tipoProducto),
                                 ProductoNameSingular(html, tipoProducto));
        }

        public static string ProductoShowMessage(this HtmlHelper html, TipoProductoEnum tipoProducto)
        {
            string productoShowMessage = "Aquí se muestra la información detallada de{0} {1} como está en el sistema.";

            return String.Format(productoShowMessage, GetArticuloDefinidoIdioma(tipoProducto),
                                 ProductoNameSingular(html, tipoProducto));
        }

        public static string ProductoNameSingular(this HtmlHelper html, TipoProductoEnum tipoProducto)
        {
            string productName = String.Empty;
            switch (tipoProducto)
            {
                case TipoProductoEnum.Articulo:
                    productName = "Artículo en revista de investigación";
                    break;
                case TipoProductoEnum.ArticuloDifusion:
                    productName = "Artículo en revista de difusión";
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
                    productName = "Tesis dirigida";
                    break;
                case TipoProductoEnum.Resena:
                    productName = "Reseña/Nota crítica";
                    break;
                case TipoProductoEnum.OrganoInterno:
                    productName = "Participación en órgano Interno";
                    break;
                case TipoProductoEnum.Distincion:
                    productName = "Distincion académica";
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
                    productName = "Artículos en revistas de difusión";
                    break;
                case TipoProductoEnum.Capitulo:
                    productName = "Capítulos en libros";
                    break;
                case TipoProductoEnum.Curso:
                    productName = "Cursos";
                    break;
                case TipoProductoEnum.Dictamen:
                    productName = "Dictamenes";
                    break;
                case TipoProductoEnum.Evento:
                    productName = "Organización y participación de eventos académicos";
                    break;
                case TipoProductoEnum.Libro:
                    productName = "Libros";
                    break;
                case TipoProductoEnum.ObraTraducida:
                    productName = "Obras traducidas";
                    break;
                case TipoProductoEnum.OrganoExterno:
                    productName = "Participaciónes Honoríficas en Órganos Colegiados Externos";
                    break;
                case TipoProductoEnum.ParticipacionMedio:
                    productName = "Difusiónes del conocimiento";
                    break;
                case TipoProductoEnum.Reporte:
                    productName = "Reportes técnicos/Documentos de trabajo";
                    break;
                case TipoProductoEnum.TesisDirigida:
                    productName = "Tesis dirigidas";
                    break;
				case TipoProductoEnum.Resena:
                    productName = "Reseñas/Notas críticas";
                    break;
                case TipoProductoEnum.OrganoInterno:
                    productName = "Participaciónes en órganos Internos";
                    break;
                case TipoProductoEnum.Distincion:
                    productName = "Distinciones académicas";
                    break;
            }

            return productName;
        }

        static string GetArticuloDefinidoIdioma(TipoProductoEnum tipoProducto)
        {
            string articuloIdioma = " el";
            if (tipoProducto == TipoProductoEnum.ObraTraducida || tipoProducto == TipoProductoEnum.ParticipacionMedio
                || tipoProducto == TipoProductoEnum.TesisDirigida || tipoProducto == TipoProductoEnum.Resena)
                articuloIdioma = " la";
            return articuloIdioma;
        }

        static string GetArticuloIndefinidoIdioma(TipoProductoEnum tipoProducto)
        {
            string articuloIndefinidoIdioma = " un";
            if (tipoProducto == TipoProductoEnum.ObraTraducida || tipoProducto == TipoProductoEnum.ParticipacionMedio 
                || tipoProducto == TipoProductoEnum.TesisDirigida || tipoProducto == TipoProductoEnum.Resena)
                articuloIndefinidoIdioma = " una";
            return articuloIndefinidoIdioma;
        }

        static string GetProductoNewGenderText(TipoProductoEnum tipoProducto)
        {
            string generoNuevo = " nuevo";
            if (tipoProducto == TipoProductoEnum.ObraTraducida || tipoProducto == TipoProductoEnum.ParticipacionMedio
                || tipoProducto == TipoProductoEnum.TesisDirigida || tipoProducto == TipoProductoEnum.Resena)
                generoNuevo = " nueva";
            return generoNuevo;
        }
    }
}