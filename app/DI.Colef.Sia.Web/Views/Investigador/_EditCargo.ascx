<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="form" id="cargoList">
    <tr>
        <th class="subform">Cargo</th>
    </tr>
    <% foreach(var cargo in Model.CargosInvestigador) { %>
    <tr id="cargo_<%=Html.Encode(cargo.Id) %>">
        <td class="subform">
            <%=Html.Encode(cargo.CargoNombre) %> <span class="more_info"><%=Html.Encode(cargo.Fecha) %>, <%=Html.Encode(cargo.SedeNombre) %></span>
            <div class="meta_info"><%=Html.Encode(cargo.DepartamentoNombre) %></div>
        </td>
    </tr>
    <% } %>
</table>
<div id="cargo_new" class="floatl btn_container">
    <span class="btn btn_small_white">
	    <%=Html.ActionLink("+ Nuevo Cargo", "NewCargo", new { Id = Model.Id }, new { @class = "remote get" })%>
	</span>
</div>
<div id="cargo_form" class="display:hidden;"></div>