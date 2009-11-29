<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<CursoForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2><%=Html.Encode(Model.Title) %></h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
	<div id="introduccion">
		<p>Para modificar el curso utilice los siguientes campos para realizar cambios dentro del sistema.</p>
	</div><!--end introduccion-->	
</asp:Content>

<asp:Content ID="sidebarContent" ContentPlaceHolderID="SidebarContentPlaceHolder" runat="server">
    <div id="barra">
        <div id="asistente">
            <h3>Asistente de secci&oacute;n</h3>
            <% Html.RenderPartial("_EditSidebar"); %>
        </div><!--end asistente-->
    </div><!--end barra-->
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div id="textos">
    
	    <% Html.RenderPartial("_Message"); %>    
	    <div id="forma">
		
            <% using (Html.BeginForm("Update", "Curso")){ %>
		        <%=Html.AntiForgeryToken() %>
                <%=Html.Hidden("Id", Model.Form.Id) %>

                <h4>Datos del curso</h4>                
                <% Html.RenderPartial("_DatosCurso", Model.Form); %>
            
                <% Html.RenderPartial("_Show2doNivel", new ShowFieldsForm { Nivel2Id = Model.Form.Nivel2Id , Nivel2Nombre = Model.Form.Nivel2Nombre, ModelId = Model.Form.Id}); %>
                <% Html.RenderPartial("_ShowSubdisciplina", new ShowFieldsForm { Areas = Model.Form.Areas, Disciplinas = Model.Form.Disciplinas, Subdisciplinas = Model.Form.Subdisciplinas, IsShowForm = false }); %>
            
                <h4>Complementaria CVU</h4>    
                <p>
	                <label>Pa&iacute;s</label>
	                <%=Html.DropDownList("Pais", Model.Form.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
		                "Seleccione ...")%>
	                <span class="cvu"></span>
                </p>

                <p class="submit">
                    <%=Html.SubmitButton("Guardar", "Guardar cambios") %> &oacute; <%=Html.ActionLink<CursoController>(x => x.Index(), "Regresar")%>
                </p>
            <% } %>
	    </div><!--end forma-->	
    		
    </div><!--end textos-->
    
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
        cursoSetup();
    });
</script>
</asp:Content>