<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<MovilidadAcademicaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="form" id="proyectoList">
    <tr>
        <th class="subform">Proyecto</th>
    </tr>
    <% if (Model.ProyectoMovilidadAcademicas != null){%>
        <% foreach(var proyecto in Model.ProyectoMovilidadAcademicas) { %>
        <tr id="proyecto_<%=Html.Encode(proyecto.Id) %>">
            <td class="subform">
                <%=Html.Encode(proyecto.ProyectoNombre)%>
            </td>
        </tr>
        <% } %>
    <% } else { %>
        <tr id="proyectoEmptyList_form">
            <td class="subform">
                No hay proyectos definidos
            </td>
        </tr>
    <% } %>
</table>
<div id="proyecto_new" class="floatl btn_container">
    <span class="btn btn_small_white">
	    <%=Html.ActionLink("+ Nuevo Proyecto", "NewProyecto", new { Id = Model.Id }, new { @class = "remote get" })%>
	</span>
</div>
<div id="proyecto_form" class="display:hidden;"></div>
	