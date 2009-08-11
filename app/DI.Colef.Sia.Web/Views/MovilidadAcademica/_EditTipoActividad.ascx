<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<MovilidadAcademicaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

	<table class="form" id="tipoactividadList">
    <tr>
        <th class="subform">Tipo Actividad</th>
    </tr>
    <% if (Model.TipoActividadMovilidadAcademicas != null){%>
        <% foreach(var tipoActividad in Model.TipoActividadMovilidadAcademicas) { %>
        <tr id="tipoactividad_<%=Html.Encode(tipoActividad.Id) %>">
            <td class="subform">
                <%=Html.Encode(tipoActividad.TipoActividadNombre)%>
            </td>
        </tr>
        <% } %>
    <% } else { %>
        <tr id="tipoactividadEmptyList_form">
            <td class="subform">
                No hay actividades definidas
            </td>
        </tr>
    <% } %>
</table>
<div id="tipoactividad_new" class="floatl btn_container">
    <span class="btn btn_small_white">
	    <%=Html.ActionLink("+ Nuevo Tipo Actividad", "NewTipoActividad", new { Id = Model.Id }, new { @class = "remote get" })%>
	</span>
</div>
<div id="tipoactividad_form" class="display:hidden;"></div>
	