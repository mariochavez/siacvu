using System;
using System.Web.Mvc;
using System.Web.Mvc.Html;
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
                info += String.Format("<br />aún sin firmar, trabajo en proceso");
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
                                         html.ActionLinkForAreas<HomeController>(
                                             x => x.Edit(producto.Id, producto.TipoProducto), "Editar"));
            else if(!isDGAA)
            {
                if(!producto.IsFirmed() && !producto.IsValidated())
                {
                    actions += String.Format("<span>{0}</span>",
                                             html.ActionLinkForAreas<HomeController>(
                                                 x => x.Edit(producto.Id, producto.TipoProducto), "Editar"));
                    actions += String.Format("<span>{0}</span>",
                                             html.ActionLink("Firmar", "Sign",
                                                             new
                                                                 {
                                                                     Id = producto.Id,
                                                                     TipoProducto = producto.TipoProducto
                                                                 },
                                                             new {@class = "remote put"})
                        );
                }else if(producto.IsFirmed() && !producto.IsValidated())
                    actions += String.Format("<span>{0}</span>",
                                             html.ActionLinkForAreas<HomeController>(
                                                 x => x.Show(producto.Id, producto.TipoProducto), "Ver"));

            }

            return actions;
            //<%if (Page.User.IsInRole("DGAA") && producto.IsFirmed()) { %>
            //            <span><%=Html.ActionLinkForAreas<HomeController>(x => x.Edit(producto.Id, producto.TipoProducto), "Editar")%></span>
            //        <% } else if(Page.User.IsInRole("Investigadores")) { %>
            //            <% if(!producto.IsFirmed() && !producto.IsValidated()) { %>
            //                <span><%=Html.ActionLinkForAreas<HomeController>(x => x.Edit(producto.Id, producto.TipoProducto), "Editar")%></span>
            //                <span><%=Html.ActionLinkForAreas<HomeController>(x => x.Sign(producto.Id, producto.TipoProducto), "Firmar")%></span>
            //            <% } else if(producto.IsFirmed() && !producto.IsValidated()) { %>
            //                <span><%=Html.ActionLinkForAreas<HomeController>(x => x.Show(producto.Id, producto.TipoProducto), "Ver")%></span>
            //            <%} else if(producto.IsValidated()) { %>
            //                <span><%=Html.ActionLinkForAreas<HomeController>(x => x.Edit(producto.Id, producto.TipoProducto), "Editar")%></span>
            //            <% } %>
            //        <% } %>
        }
    }
}