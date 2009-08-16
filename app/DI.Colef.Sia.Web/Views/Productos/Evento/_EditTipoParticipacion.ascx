<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="form" id="tipoparticipacionList">
    <tr>
        <th class="subform">Tipo Participacion</th>
    </tr>
    <% if (Model.TipoParticipacionEventos != null){%>
        <% foreach (var tipoParticipacion in Model.TipoParticipacionEventos){ %>
        <tr id="tipoparticipacion_<%=Html.Encode(tipoParticipacion.Id) %>">
            <td class="subform">
                <%=Html.Encode(tipoParticipacion.TipoParticipacionNombre)%>
            </td>
        </tr>
        <% } %>
    <% } else { %>
        <tr id="tipoparticipacionEmptyList_form">
            <td class="subform">
                No hay participaciones definidas
            </td>
        </tr>
    <% } %>
</table>
<div id="tipoparticipacion_new" class="floatl btn_container">
    <span class="btn btn_small_white">
	    <%=Html.ActionLink("+ Nuevo Tipo Participacion", "NewTipoParticipacion", new { Id = Model.Id }, new { @class = "remote get" })%>
	</span>
</div>
<div id="tipoparticipacion_form" class="display:hidden;"></div>