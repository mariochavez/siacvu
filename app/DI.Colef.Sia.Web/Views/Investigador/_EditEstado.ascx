<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="form" id="estadoList">
    <tr>
        <th class="subform">Estado</th>
    </tr>
    <% foreach(var estado in Model.EstadosInvestigador) { %>
    <tr id="estado_<%=Html.Encode(estado.Id) %>">
        <td class="subform">
            <%=Html.Encode(estado.EstadoNombre) %> <span class="meta_info"><%=Html.Encode(estado.Fecha) %></span>
        </td>
    </tr>
    <% } %>
</table>
<div id="estado_new" class="floatl btn_container">
    <span class="btn btn_small_white">
	    <%=Html.ActionLink("+ Nuevo Estado", "NewEstado", new { Id = Model.Id }, new { @class = "remote get" })%>
	</span>
</div>
<div id="estado_form" class="display:hidden;"></div>