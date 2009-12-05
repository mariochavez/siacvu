<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ParticipacionAcademiaForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2>
        <%=Html.Encode(Model.Title) %>
    </h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
    <div id="introduccion">
        <p>
            Aqu&iacute; se muestra la informaci&oacute;n detallada de la participaci&oacute;n en academia como est&aacute; en el sistema.
		</p>
    </div><!--end introduccion-->
</asp:Content>

<asp:Content ID="sidebarContent" ContentPlaceHolderID="SidebarContentPlaceHolder" runat="server">
    <div id="barra">
        <div id="asistente">
            <h3>Asistente de secci&oacute;n</h3>
            <% Html.RenderPartial("_ShowSidebar"); %>
        </div><!--end asistente-->

    </div><!--end barra-->
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div id="textos">

        <div id="forma">
            <div id="campos">
                <p>
                    <label>Nombre del producto</label>
                    <span class="valor"><%= Html.Encode(Model.Form.NombreProducto)%>&nbsp;</span>
                </p>
                <% if(Model.Form.RevistaPublicacionTitulo != ""){ %>
                    <% Html.RenderPartial("_ShowRevista", Model.Form.ShowFields); %>
                <% } %>
                <p>
                    <label>Volumen</label>
                        <span class="valor"><%= HumanizeHelper.Volumen(Model.Form.Volumen)%>&nbsp;</span>
                </p>
                
                <% Html.RenderPartial("_ShowInstitucion", Model.Form.ShowFields); %>
                
                <p>
                    <label>Editorial</label>
                    <span class="valor"><%= Html.Encode(Model.Form.EditorialNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Pa&iacute;s</label>
                    <span class="valor"><%= Html.Encode(Model.Form.PaisNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Estado actual</label>
                    <span class="valor"><%= HumanizeHelper.EstadoProducto(Model.Form.EstadoProducto)%>&nbsp;</span>
                </p>
                <% if (Model.Form.EstadoProducto == 2) { %>
                    <p>
                        <label>Fecha de aceptaci&oacute;n</label>
                        <span class="valor"><%= Html.Encode(Model.Form.FechaAceptacion)%>&nbsp;
                        </span><span>Formato (dd/mm/yyyy)</span>
                    </p>
                <% } if (Model.Form.EstadoProducto == 3){ %>
                    <p>
                        <label>Fecha de publicaci&oacute;n</label>
                        <span class="valor"><%= Html.Encode(Model.Form.FechaPublicacion)%>&nbsp;
                        </span><span>Formato (dd/mm/yyyy)</span>
                    </p>
                <% } %>
                
                <% Html.RenderPartial("_ShowProyecto", Model.Form.ShowFields); %>
                
                <p>
                    <label>A&ntilde;o de edici&oacute;n</label>
                    <span class="valor"><%= Html.Encode(Model.Form.FechaEdicion)%>&nbsp;</span>
                    <span>(Formato yyyy)</span>
                </p>
                <p>
                    <label>L&iacute;nea tem&aacute;tica</label>
                    <span class="valor"><%= Html.Encode(Model.Form.LineaTematicaNombre)%>&nbsp;</span>
                </p>
                
                <p class="submit">
                    <%=Html.ActionLink<ParticipacionAcademiaController>(x => x.Index(), "Regresar") %>
                </p>
            </div><!--end campos-->
        </div><!--end lista-->

    </div><!--end textos-->
    
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
    });
</script>
</asp:Content>