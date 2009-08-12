<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<LibroForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
	<table class="form" id="coautorexternoList">
    <tr>
        <th class="subform">Coautores Externos</th>
    </tr>
    <% if (Model.CoautorExternoLibros != null){%>
        <% foreach(var coautorExterno in Model.CoautorExternoLibros) { %>
        <tr id="coautorexterno_<%=Html.Encode(coautorExterno.Id) %>">
            <td class="subform">
                <%=Html.Encode(coautorExterno.InvestigadorExternoNombre)%>
            </td>
        </tr>
        <% } %>
    <% } else { %>
        <tr id="coautorexternoEmptyList_form">
            <td class="subform">
                No hay Coautores Externos definidos
            </td>
        </tr>
    <% } %>
</table>
<div id="coautorexterno_new" class="floatl btn_container">
    <span class="btn btn_small_white">
	    <%=Html.ActionLink("+ Nuevo Coautor Externo", "NewCoautorExterno", new { Id = Model.Id }, new { @class = "remote get" })%>
	</span>
</div>
<div id="coautorexterno_form" class="display:hidden;"></div>