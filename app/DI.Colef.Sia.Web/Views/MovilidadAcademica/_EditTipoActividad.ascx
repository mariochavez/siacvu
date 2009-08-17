<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<MovilidadAcademicaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div id="tipoactividadList" class="minilista">
	<h5>Tipo Actividad</h5>
	<% if (Model.TipoActividadMovilidadAcademicas != null){%>
	    <% foreach (var tipoActividad in Model.TipoActividadMovilidadAcademicas){ %>
            <div id="tipoactividad_<%=Html.Encode(tipoActividad.Id) %>" class="sublista">
    	        <h6><%=Html.Encode(tipoActividad.TipoActividadNombre)%></h6>
            </div><!--end tipoActividadLista-->
        <% } %>
    <% } else { %>
        <div id="tipoactividadEmptyList_form">
                No hay actividades definidas
        </div>
    <% } %>
    
    <div id="tipoactividad_new" class="minilistaboton">
		<p><span><%=Html.ActionLink("+ Nuevo Tipo Actividad", "NewTipoActividad", new { Id = Model.Id }, new { @class = "remote get" })%></span></p>
	</div><!--end minilistaboton-->	
          
</div><!--end minilista-->

<div id="tipoactividad_form" class="display:hidden;"></div>
	