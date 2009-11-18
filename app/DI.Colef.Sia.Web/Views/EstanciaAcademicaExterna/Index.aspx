<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<EstanciaAcademicaExternaForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2><%=Html.Encode(Model.Title) %></h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
    <div id="subcontenido">
        <h3>Agregar nueva estancia acad&eacute;mica externa</h3>
        <p>
            Puede agregar una nueva estancia acad&eacute;mica externa dentro de la lista de administraci&oacute;n
            presionando en el bot&oacute;n derecho de t&iacute;tulo <strong>+ Nueva estancia acad&eacute;mica externa</strong>.
		</p>
        <div class="botonzon">
            <span><%=Html.ActionLink<EstanciaAcademicaExternaController>(x => x.New(), "+ Nueva estancia académica externa") %></span>
        </div>
    </div>
</asp:Content>

<asp:Content ID="sidebarContent" ContentPlaceHolderID="SidebarContentPlaceHolder" runat="server">
    <div id="barra">
        <div id="asistente">
            <h3>Asistente de secci&oacute;n</h3>
            <p>Lista de estancias acad&eacute;micas externas registradas en el sistema.</p>
            <% Html.RenderPartial("_ListSidebar"); %>
        </div><!--end asistente-->
    </div><!--end barra-->
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
<div id="textos">
	
	<% Html.RenderPartial("_Message"); %>
	<% Html.RenderPartial("_Search"); %>
	
	<div id="lista">
		<h4>Estancias Acad&eacute;micas Externas</h4>
            
		<% if (Model.List == null || Model.List.Length == 0) { %>
			<div class="elementolista">
				<div class="elementodescripcion">
					<h5><span>No hay estancias acad&eacute;mica externas registradas</span></h5>
				</div><!--end elementodescripcion-->

			</div><!--end elementolista-->
		<% } else { %>
			<% foreach (var estanciaAcademicaExterna in Model.List) { %>
				<div class="elementolista" id="accion_<%=Html.Encode(estanciaAcademicaExterna.Id) %>">
					<div class="elementodescripcion">
						<h5><span><%=Html.Encode(estanciaAcademicaExterna.InstitucionNombre) %></span></h5>
						<h6>Modificado el <%=Html.Encode(estanciaAcademicaExterna.Modificacion) %></h6>
					</div><!--end elementodescripcion-->

					<div class="elementobotones">
				        <p>
				            <span><%=Html.ActionLink<EstanciaAcademicaExternaController>(x => x.Edit(estanciaAcademicaExterna.Id), "Editar")%></span> 
				            <span><%=Html.ActionLink("Ver", "Show", new { id = estanciaAcademicaExterna.Id })%></span>
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