<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ProyectoForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2><%=Html.Encode(Model.Title) %></h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
	<div id="introduccion">
		<p>Favor de llenar los siguientes campos para dar de alta un nuevo proyecto dentro del sistema.</p>
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
            <% using (Html.BeginForm("Create", "Proyecto")){ %>
                <%=Html.AntiForgeryToken() %>
                <%=Html.Hidden("Id", Model.Form.Id) %>
                
                <p>
                    <label>Nombre</label>
                    <%=Html.TextBox("Nombre", Model.Form.Nombre, new { @class="input420-bold-requerido", maxlength = 100 })%>
                    <%=Html.ValidationMessage("Nombre")%>
                </p>
                <p>
                    <label>Tipo de proyecto</label>
                    <%=Html.DropDownList("TipoProyecto", Model.Form.TiposProyectos.CreateSelectList<TipoProyectoForm>("Id", "Nombre"),
		                        "Seleccione ...", new {@class="requerido"})%>
		            <span class="cvu"></span>
                    <%=Html.ValidationMessage("TipoProyecto") %>
                </p>
                
                <h4>Responsables<span class="cvu"></span></h4>
	            <% Html.RenderPartial("_EditResponsableInterno", Model.Form); %>
	            
                <h4>Participantes<span class="cvu"></span></h4>
	            <% Html.RenderPartial("_EditParticipanteInterno", Model.Form); %>
				<% Html.RenderPartial("_EditParticipanteExterno", Model.Form); %>
	            
	            <% Html.RenderPartial("_DatosProyecto", Model.Form); %>
				
				<h4>Financiamiento del proyecto</h4>
				<% Html.RenderPartial("_FinanciamientoProyecto", Model.Form); %>
				
				<h4>Recursos Financieros</h4>
	            <% Html.RenderPartial("_EditRecursoFinanciero", Model.Form); %>
	            
	            <h4>Tem&aacute;tica del proyecto</h4>
	            <% Html.RenderPartial("_TematicaProyecto", Model.Form); %>
	            
	            <h4>Productos acad&eacute;micos contemplados</h4>
                <% Html.RenderPartial("_ProductoAcademicoProyecto", Model.Form); %>
                
                <h4>Participaci&oacute;n de estudiantes</h4>
                <% Html.RenderPartial("_ParticipacionEstudianteProyecto", Model.Form); %>
                
                <h4>Opcionales CVU</h4>
                <% Html.RenderPartial("_EstructuraFuncional", Model.Form); %>
                <% Html.RenderPartial("_AreaConocimiento", Model.Form); %>
                <% Html.RenderPartial("_ActividadEconomica", Model.Form); %>
                                
                <p class="submit">
                    <%=Html.SubmitButton("Guardar", "Guardar cambios") %> &oacute; <%=Html.ActionLink<ProyectoController>(x => x.Index(), "Regresar")%>
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
