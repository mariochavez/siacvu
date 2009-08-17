<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<MovilidadAcademicaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div id="productoderivadoList" class="minilista">
	<h5>Producto Derivado</h5>
	<% if (Model.ProductoDerivadoMovilidadAcademicas != null){%>
	    <% foreach (var productoDerivado in Model.ProductoDerivadoMovilidadAcademicas){ %>
            <div id="productoderivado_<%=Html.Encode(productoDerivado.Id) %>" class="sublista">
    	        <h6><%=Html.Encode(productoDerivado.ProductoDerivadoNombre)%></h6>
            </div><!--end productoDerivadoLista-->
        <% } %>
    <% } else { %>
        <div id="productoderivadoEmptyList_form">
                No hay productos derivados definidos
        </div>
    <% } %>
    
    <div id="productoderivado_new" class="minilistaboton">
		<p><span><%=Html.ActionLink("+ Nuevo Producto Derivado", "NewProductoDerivado", new { Id = Model.Id }, new { @class = "remote get" })%></span></p>
	</div><!--end minilistaboton-->	
          
</div><!--end minilista-->

<div id="productoderivado_form" class="display:hidden;"></div>