<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ObraTraducidaForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Core"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2>
        <%=Html.ProductoListTitle(TipoProductoEnum.ObraTraducida) %>
    </h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
    <div id="subcontenido">
        <h3>
            <%=Html.ProductoListSubTitle(TipoProductoEnum.ObraTraducida) %>
        </h3>
        <p>
            <%=Html.ProductoListMessage(TipoProductoEnum.ObraTraducida) %>
		</p>
        <div class="botonzon">
            <span><%=Html.ActionLink<ObraTraducidaController>(x => x.New(), Model.GetObjectNameNewButton())%></span>
        </div>
    </div>
</asp:Content>

<asp:Content ID="sidebarContent" ContentPlaceHolderID="SidebarContentPlaceHolder" runat="server">
    <div id="barra">
        <div id="asistente">
            <h3>Asistente de secci&oacute;n</h3>
            <p>Lista de obras traducidas registrados en el sistema.</p>
            <% Html.RenderPartial("_ListSidebar"); %>
        </div><!--end asistente-->
    </div><!--end barra-->
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
<div id="textos">
	
	<% Html.RenderPartial("_Message"); %>
	<% Html.RenderPartial("_Search"); %>
	
	<div id="lista">
		<h4>Obras traducidas</h4>
            
		<% Html.RenderPartial("_Producto", Model.ProductList); %>
            
	</div><!--end lista-->

</div><!--end textos-->

<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
    });
</script>

</asp:Content>