<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<MovilidadAcademicaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
	<table class="form" id="productoderivadoList">
    <tr>
        <th class="subform">Producto Derivado</th>
    </tr>
    <% if (Model.ProductoDerivadoMovilidadAcademicas != null){%>
        <% foreach(var productoDerivado in Model.ProductoDerivadoMovilidadAcademicas) { %>
        <tr id="productoderivado_<%=Html.Encode(productoDerivado.Id) %>">
            <td class="subform">
                <%=Html.Encode(productoDerivado.ProductoDerivadoNombre)%>
            </td>
        </tr>
        <% } %>
    <% } else { %>
        <tr id="productoderivadoEmptyList_form">
            <td class="subform">
                No hay productos derivados definidos
            </td>
        </tr>
    <% } %>
</table>
<div id="productoderivado_new" class="floatl btn_container">
    <span class="btn btn_small_white">
	    <%=Html.ActionLink("+ Nuevo Producto Derivado", "NewProductoDerivado", new { Id = Model.Id }, new { @class = "remote get" })%>
	</span>
</div>
<div id="productoderivado_form" class="display:hidden;"></div>