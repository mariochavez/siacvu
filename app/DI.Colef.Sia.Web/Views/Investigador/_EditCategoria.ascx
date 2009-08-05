<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="form" id="categoriaList">
    <tr>
        <th class="subform">Categoria</th>
    </tr>
    <% foreach(var categoria in Model.CategoriasInvestigador) { %>
    <tr id="categoria_<%=Html.Encode(categoria.Id) %>">
        <td class="subform">
            <%=Html.Encode(categoria.CategoriaNombre) %> <span class="meta_info"><%=Html.Encode(categoria.Fecha) %></span>
        </td>
    </tr>
    <% } %>
</table>
<div id="categoria_new" class="floatl btn_container">
    <span class="btn btn_small_white">
	    <%=Html.ActionLink("+ Nueva categoria", "NewCategoria", new { Id = Model.Id }, new { @class = "remote get" })%>
	</span>
</div>
<div id="categoria_form" class="display:hidden;"></div>