<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<MovilidadAcademicaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="productoderivadoList">
	<h5>Producto Derivado</h5>
	
	<% if (Model.ProductoDerivadoMovilidadAcademicas != null && Model.ProductoDerivadoMovilidadAcademicas.Length > 0){%>
	    <% foreach(var productoDerivado in Model.ProductoDerivadoMovilidadAcademicas){ %>
            <div class="sublista" id="productoderivado_<%=Html.Encode(productoDerivado.ProductoDerivadoId)%>">
    	        <h6>
    	            <%=Html.Encode(productoDerivado.ProductoDerivadoNombre)%>
    	            <% if(Model.Id == 0) { %>
	                    <%=Html.Hidden("ProductoDerivadoMovilidadAcademica.ProductoDerivadoId_New", productoDerivado.ProductoDerivadoId)%>
	                <% } %>
	            </h6>
            </div><!--end productoDerivadoLista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="productoderivadoEmptyList_form">
            <h6><span>No hay productos derivados definidos</span></h6>
        </div>
    <% } %>
    
    <div id="productoderivado_new" class="minilistaboton">
		<p>
		    <span>
		        <%=Html.ActionLink("+ Nuevo Producto Derivado", "NewProductoDerivado", new { Id = Model.Id }, new { @class = "remote get" })%>
		    </span>
		</p>
	</div><!--end minilistaboton-->	
          
</div><!--end minilista-->

<div id="productoderivado_form" class="display:hidden;"></div>