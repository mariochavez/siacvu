<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div id="categoriaList" class="minilista">
	<h5>Categorias</h5>
	<% foreach(var categoria in Model.CategoriasInvestigador) { %>
        <div id="estado_<%=Html.Encode(categoria.Id) %>" class="sublista">
    	    <h6><%=Html.Encode(categoria.CategoriaNombre)%> <span><%=Html.Encode(categoria.Fecha)%></span></h6>
        </div><!--end estadolista-->
    <% } %>
    
    <div id="categoriaNew" class="minilistaboton">
		<p><span><%=Html.ActionLink("+ Nueva Categoria", "NewCategoria", new { Id = Model.Id }, new { @class = "remote get" })%></span></p>
	</div><!--end minilistaboton-->	
          
</div><!--end minilista-->

<div id="categoriaForm" class="display:hidden;"></div>