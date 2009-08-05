<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="form" id="sniList">
    <tr>
        <th class="subform">Sni</th>
    </tr>
    <% foreach(var sni in Model.SNIsInvestigador) { %>
    <tr id="sni_<%=Html.Encode(sni.Id) %>">
        <td class="subform">
            <%=Html.Encode(sni.SNINombre) %> <span class="meta_info">De <%=Html.Encode(sni.FechaInicial) %> a <%=Html.Encode(sni.FechaFinal) %></span>
        </td>
    </tr>
    <% } %>
</table>
<div id="sni_new" class="floatl btn_container">
    <span class="btn btn_small_white">
	    <%=Html.ActionLink("+ Nuevo Sni", "NewSni", new { Id = Model.Id }, new { @class = "remote get" })%>
	</span>
</div>
<div id="sni_form" class="display:hidden;"></div>