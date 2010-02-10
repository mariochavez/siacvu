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
            string productoEditTitle = "Para modificar {0} {1} utilice los siguientes campos para realizar cambios dentro del sistema.";

            return String.Format(productoEditTitle, GetArticuloIdioma(tipoProducto), ProductoNameSingular(html, tipoProducto));
        }

        public static string ProductoShowTitle(this HtmlHelper html, TipoProductoEnum tipoProducto)
        {
            string productoShowTitle = "Aquí se muestra la información detallada de {0} {1} como está en el sistema.";

            return String.Format(productoShowTitle, GetArticuloIdioma(tipoProducto), ProductoNameSingular(html, tipoProducto));
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
                    productName = "Órgano externo";
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
            }

            return productName;
        }

        public static string ProductoNamePlural(this HtmlHelper html, TipoProductoEnum tipoProducto)
        {
            string productName = string.Empty;

            switch (tipoProducto)
            {
                case TipoProductoEnum.Articulo:
                    productName = "Artículos en revista de investigación";
                    break;
                case TipoProductoEnum.ArticuloDifusion:
                    productName = "Artículos en revista de difusión";
                    break;
                case TipoProductoEnum.Capitulo:
                    productName = "Capítulos en libros";
                    break;
                case TipoProductoEnum.Curso:
                    productName = "Curso";
                    break;
                case TipoProductoEnum.Dictamen:
                    productName = "Dictamenes";
                    break;
                case TipoProductoEnum.Evento:
                    productName = "Eventos";
                    break;
                case TipoProductoEnum.Libro:
                    productName = "Libros";
                    break;
                case TipoProductoEnum.ObraTraducida:
                    productName = "Obras traducidas";
                    break;
                case TipoProductoEnum.OrganoExterno:
                    productName = "Órganos externos";
                    break;
                case TipoProductoEnum.ParticipacionMedio:
                    productName = "Participaciones en medios";
                    break;
                case TipoProductoEnum.Reporte:
                    productName = "el Reportes técnicos";
                    break;
                case TipoProductoEnum.TesisDirigida:
                    productName = "tesis dirigidas";
                    break;
            }

            return productName;
        }

        static string GetArticuloIdioma(TipoProductoEnum tipoProducto)
        {
            string articuloIdioma = "el";
            if (tipoProducto == TipoProductoEnum.ObraTraducida || tipoProducto == TipoProductoEnum.ParticipacionMedio
                || tipoProducto == TipoProductoEnum.TesisDirigida || tipoProducto == TipoProductoEnum.Resena)
                articuloIdioma = "la";
            return articuloIdioma;
        }
    }
	
}