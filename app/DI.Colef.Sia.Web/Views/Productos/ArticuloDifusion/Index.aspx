<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ArticuloDifusionForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Core" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2>
        <%=Html.ProductoListTitle(TipoProductoEnum.ArticuloDifusion) %>
    </h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
    <div id="subcontenido">
        <h3>
            Agregar <%=Html.ProductoListSubTitle(TipoProductoEnum.ArticuloDifusion) %>
        </h3>
        <p>
            <%=Html.ProductoListMessage(TipoProductoEnum.ArticuloDifusion)%>
        </p>
        <% if (User.IsInRole("Investigadores")) { %>
        <div class="botonzon">
            <span><%=Html.ActionLink<ArticuloDifusionController>(x => x.New(), Model.GetObjectNameNewButton())%></span>
        </div>
        <% } %>
    </div>
</asp:Content>

<asp:Content ID="sidebarContent" ContentPlaceHolderID="SidebarContentPlaceHolder" runat="server">
    <div id="barra">
        <div id="asistente">
            <h3>Asistente de secci&oacute;n</h3>
            <p>Lista de <%=Html.Encode(Model.GetPluralObjectName())%> registrados en el sistema.</p>
            <% Html.RenderPartial("_ListSidebar"); %>
        </div><!--end asistente-->
    </div><!--end barra-->
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div id="textos">
        <% Html.RenderPartial("_Message"); %>
        <% Html.RenderPartial("_Search"); %>
        <div id="lista">
            <h4>
                <%=Html.Encode(Model.GetPluralObjectName())%></h4>
            <% if (Model.List == null || Model.List.Length == 0) { %>
            <div class="elementolista">
                <div class="elementodescripcion">
                    <h5>
                        <span>No hay art&iacute;culos registrados</span></h5>
                </div>
                <!--end elementodescripcion-->
            </div>
            <!--end elementolista-->
            <% } else { %>
            <% foreach (var articulo in Model.List) { %>
            <div class="elementolista" id="accion_<%=Html.Encode(articulo.Id) %>">
                <div class="elementodescripcion">
                    <h5>
                        <span>
                            <%=Html.Encode(articulo.Titulo)%></span></h5>
                    <h6>
                        Modificado el
                        <%=Html.Encode(articulo.Modificacion) %></h6>
                </div>
                <!--end elementodescripcion-->
                <div class="elementobotones">
                    <p>
                        <span>
                            <%=Html.ActionLink<ArticuloDifusionController>(x => x.Edit(articulo.Id), "Editar") %></span>
                        <span>
                            <%=Html.ActionLink("Ver", "Show", new { id = articulo.Id })%></span>
                    </p>
                </div>
                <!--end elementobotones-->
            </div>
            <!--end elementolista-->
            <% } %>
            <% } %>
        </div>
        <!--end lista-->
    </div>
    <!--end textos-->
    <script type="text/javascript">
        $(document).ready(function () {
            setupDocument();
        });
    </script>
</asp:Content>
