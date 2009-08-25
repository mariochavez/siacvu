<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<MovilidadAcademicaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div id="proyectoList" class="minilista">
	<h5>Proyecto</h5>
	
	<% if (Model.ProyectoMovilidadAcademicas != null && Model.ProyectoMovilidadAcademicas.Length > 0){%>
	    <% foreach (var proyecto in Model.ProyectoMovilidadAcademicas){ %>
            <div class="sublista" id="proyecto_<%=Html.Encode(proyecto.ProyectoId) %>">
    	        <h6>
    	            <%=Html.Encode(proyecto.ProyectoNombre)%>
    	            <% if(Model.Id == 0) { %>
	                    <%=Html.Hidden("ProyectoMovilidadAcademica.ProyectoId_New", proyecto.ProyectoId)%>
	                <% } %>
                </h6>
            </div><!--end proyectoLista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="proyectoEmptyList_form">
            <h6><span>No hay proyectos registrados</span></h6>
        </div>
    <% } %>
    
    <div id="proyecto_new" class="minilistaboton">
		<p><span><%=Html.ActionLink("+ Nuevo proyecto", "NewProyecto", new { Id = Model.Id }, new { @class = "remote get" })%></span></p>
	</div><!--end minilistaboton-->	
          
</div><!--end minilista-->

<div id="proyecto_form" class="display:hidden;"></div>
	