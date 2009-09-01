<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

	<table class="form" id="responsableinternoList">
    <tr>
        <th class="subform">Responsable Interno</th>
    </tr>
    <% if (Model.ResponsableInternoProyectos != null){%>
        <% foreach(var responsableInterno in Model.ResponsableInternoProyectos) { %>
        <tr id="responsableinterno_<%=Html.Encode(responsableInterno.Id) %>">
            <td class="subform">
                <%=Html.Encode(responsableInterno.Mapping)%>
            </td>
        </tr>
        <% } %>
    <% } else { %>
        <tr id="responsableinternoEmptyList_form">
            <td class="subform">
                No hay Responsable Interno definidos
            </td>
        </tr>
    <% } %>
</table>
<div id="responsableinterno_new" class="floatl btn_container">
    <span class="btn btn_small_white">
	    <%=Html.ActionLink("+ Nuevo Responsable Interno", "NewResponsableInterno", new { Id = Model.Id }, new { @class = "remote get" })%>
	</span>
</div>
<div id="responsableinterno_form" class="display:hidden;"></div>
	<table class="form" id="responsableexternoList">
    <tr>
        <th class="subform">Responsable Externo</th>
    </tr>
    <% if (Model.ResponsableExternoProyectos != null){%>
        <% foreach(var responsableExterno in Model.ResponsableExternoProyectos) { %>
        <tr id="responsableexterno_<%=Html.Encode(responsableExterno.Id) %>">
            <td class="subform">
                <%=Html.Encode(responsableExterno.Mapping)%>
            </td>
        </tr>
        <% } %>
    <% } else { %>
        <tr id="responsableexternoEmptyList_form">
            <td class="subform">
                No hay Responsable Externo definidos
            </td>
        </tr>
    <% } %>
</table>
<div id="responsableexterno_new" class="floatl btn_container">
    <span class="btn btn_small_white">
	    <%=Html.ActionLink("+ Nuevo Responsable Externo", "NewResponsableExterno", new { Id = Model.Id }, new { @class = "remote get" })%>
	</span>
</div>
<div id="responsableexterno_form" class="display:hidden;"></div>
	<table class="form" id="participanteinternoList">
    <tr>
        <th class="subform">Participante Interno</th>
    </tr>
    <% if (Model.ParticipanteInternoProyectos != null){%>
        <% foreach(var participanteInterno in Model.ParticipanteInternoProyectos) { %>
        <tr id="participanteinterno_<%=Html.Encode(participanteInterno.Id) %>">
            <td class="subform">
                <%=Html.Encode(participanteInterno.Mapping)%>
            </td>
        </tr>
        <% } %>
    <% } else { %>
        <tr id="participanteinternoEmptyList_form">
            <td class="subform">
                No hay Participante Interno definidos
            </td>
        </tr>
    <% } %>
</table>
<div id="participanteinterno_new" class="floatl btn_container">
    <span class="btn btn_small_white">
	    <%=Html.ActionLink("+ Nuevo Participante Interno", "NewParticipanteInterno", new { Id = Model.Id }, new { @class = "remote get" })%>
	</span>
</div>
<div id="participanteinterno_form" class="display:hidden;"></div>
	<table class="form" id="participanteexternoList">
    <tr>
        <th class="subform">Participante Externo</th>
    </tr>
    <% if (Model.ParticipanteExternoProyectos != null){%>
        <% foreach(var participanteExterno in Model.ParticipanteExternoProyectos) { %>
        <tr id="participanteexterno_<%=Html.Encode(participanteExterno.Id) %>">
            <td class="subform">
                <%=Html.Encode(participanteExterno.Mapping)%>
            </td>
        </tr>
        <% } %>
    <% } else { %>
        <tr id="participanteexternoEmptyList_form">
            <td class="subform">
                No hay Participante Externo definidos
            </td>
        </tr>
    <% } %>
</table>
<div id="participanteexterno_new" class="floatl btn_container">
    <span class="btn btn_small_white">
	    <%=Html.ActionLink("+ Nuevo Participante Externo", "NewParticipanteExterno", new { Id = Model.Id }, new { @class = "remote get" })%>
	</span>
</div>
<div id="participanteexterno_form" class="display:hidden;"></div>
	