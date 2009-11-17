<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<EstanciaAcademicaExternaForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2><%=Html.Encode(Model.Title) %></h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
	<div id="introduccion">
	    <p>
	        Favor de llenar los siguientes campos para dar de alta un nuevo estancia academica externa dentro del sistema.
	    </p>
	</div><!--end introduccion-->
</asp:Content>

<asp:Content ID="sidebarContent" ContentPlaceHolderID="SidebarContentPlaceHolder" runat="server">
	<div id="barra">
	    <div id="asistente">
	        <h3>Asistente de secci&oacute;n</h3>
	        <% Html.RenderPartial("_NewSidebar"); %>
	    </div><!--end asistente-->
	</div><!--end barra-->
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
	<div id="textos">
	
	    <% Html.RenderPartial("_Message"); %>
	    
	    <div id="forma">
			<% using (Html.BeginForm("Create", "EstanciaAcademicaExterna")) { %>
				<%=Html.AntiForgeryToken() %>
				<%=Html.Hidden("Id", Model.Form.Id) %>			
				<p>
					<label>Institucion</label>

						
						
						
						
						
					<%=Html.DropDownList("Institucion", Model.Form.Instituciones.CreateSelectList<InstitucionForm>("Id", "Nombre"),
						"Seleccione ...")%>
					<%=Html.ValidationMessage("Institucion") %>
				</p>
				<p>
					<label>Lineas Investigacion</label>

						
						
					<%=Html.TextBox("LineasInvestigacion", Model.Form.LineasInvestigacion, new { @class = "input250", maxlength = 100 })%>
					<%=Html.ValidationMessage("LineasInvestigacion")%>
						
						
						
				</p>
				<p>
					<label>Fecha Inicial</label>

						
						
						
					<%=Html.TextBox("FechaInicial", Model.Form.FechaInicial, new { @class="datetime input100", maxlength = 10 })%>
					<span>(Formato dd/mm/yyyy)</span>
					<%=Html.ValidationMessage("FechaInicial")%>
						
						
				</p>
				<p>
					<label>Fecha Final</label>

						
						
						
					<%=Html.TextBox("FechaFinal", Model.Form.FechaFinal, new { @class="datetime input100", maxlength = 10 })%>
					<span>(Formato dd/mm/yyyy)</span>
					<%=Html.ValidationMessage("FechaFinal")%>
						
						
				</p>
				<p>
					<label>Actividades</label>

						
						
					<%=Html.TextBox("Actividades", Model.Form.Actividades, new { @class = "input250", maxlength = 100 })%>
					<%=Html.ValidationMessage("Actividades")%>
						
						
						
				</p>
				<p>
					<label>Logros</label>

						
						
					<%=Html.TextBox("Logros", Model.Form.Logros, new { @class = "input250", maxlength = 100 })%>
					<%=Html.ValidationMessage("Logros")%>
						
						
						
				</p>
		
	            <p class="submit">
	                <%=Html.SubmitButton("Guardar", "Guardar Cambios") %> &oacute; <%=Html.ActionLink<EstanciaAcademicaExternaController>(x => x.Index(), "Regresar") %>
	            </p>
	        <% } %>
	    </div><!--end forma-->
    
	</div><!--end textos-->
    
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
    });
</script>
</asp:Content>
