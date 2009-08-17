<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<MovilidadAcademicaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div id="proyectoList" class="minilista">
	<h5>Proyecto</h5>
	<% if (Model.ProyectoMovilidadAcademicas != null){%>
	    <% foreach (var proyecto in Model.ProyectoMovilidadAcademicas){ %>
            <div id="proyecto_<%=Html.Encode(proyecto.Id) %>" class="sublista">
    	        <h6><%=Html.Encode(proyecto.ProyectoNombre)%></h6>
            </div><!--end proyectoLista-->
        <% } %>
    <% } else { %>
        <div id="proyectoEmptyList_form">
                No hay proyectos definidos
        </div>
    <% } %>
    
    <div id="proyecto_new" class="minilistaboton">
		<p><span><%=Html.ActionLink("+ Nuevo Proyecto", "NewProyecto", new { Id = Model.Id }, new { @class = "remote get" })%></span></p>
	</div><!--end minilistaboton-->	
          
</div><!--end minilista-->

<div id="proyecto_form" class="display:hidden;"></div>
	