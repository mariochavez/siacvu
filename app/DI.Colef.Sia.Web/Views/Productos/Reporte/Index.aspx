<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ReporteForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Core"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <div id="tituloseccion">
    <h2>
        <%=Html.ProductoListTitle(TipoProductoEnum.Reporte) %>
    </h2>
    </div>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
    <div id="subcontenido">
        <h3>
            <%=Html.ProductoListSubTitle(TipoProductoEnum.Reporte) %>
        </h3>
        <p>
            <%=Html.ProductoListMessage(TipoProductoEnum.Reporte) %>
		</p>
        <div class="botonzon">
            <span><%=Html.ActionLink<ReporteController>(x => x.New(), "+ Nuevo")%></span>
        </div>
    </div><!--end subcontenido-->
</asp:Content>

<asp:Content ID="sidebarContent" ContentPlaceHolderID="SidebarContentPlaceHolder" runat="server">
    <div id="barra">
        <div id="asistente">
            <h3>Asistente de secci&oacute;n</h3>
            <p>Lista de reportes t&eacute;cnicos registrados en el sistema.</p>
            <% Html.RenderPartial("_ListSidebar"); %>
        </div><!--end asistente-->
    </div><!--end barra-->
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
<div id="textos">
	
	<% Html.RenderPartial("_Message"); %>
	<% Html.RenderPartial("_Search"); %>
	
	<div id="lista">
		<h4>Reportes t&eacute;cnicos</h4>
            
		<% if (Model.List == null || Model.List.Length == 0) { %>
			<div class="elementolista">
				<div class="elementodescripcion">
					<h5><span>No hay reportes t&eacute;cnicos registrados</span></h5>
				</div><!--end elementodescripcion-->	

			</div><!--end elementolista-->
		<% } else { %>
			<% foreach (var reporte in Model.List) { %>
				<div class="elementolista" id="accion_<%=Html.Encode(reporte.Id) %>">
					<div class="elementodescripcion">
					    <h5><span><%=Html.Encode(reporte.Titulo)%></span></h5>
						<h6>Modificado el <%=Html.Encode(reporte.Modificacion) %></h6>
					</div><!--end elementodescripcion-->

					<div class="elementobotones">
						<p>
							<span><%=Html.ActionLink<ReporteController>(x => x.Edit(reporte.Id), "Editar") %></span>
			            	<span><%=Html.ActionLink("Ver", "Show", new { id = reporte.Id })%></span>
						</p>
					</div><!--end elementobotones-->

				</div><!--end elementolista-->
			<% } %>
		<% } %>
		
    </div><!--end lista-->

</div><!--end textos-->

<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
    });
</script>

</asp:Content>
