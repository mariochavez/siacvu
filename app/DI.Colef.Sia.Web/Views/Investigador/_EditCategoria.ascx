<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div id="categoriaList" class="minilista">
	<h5>Categor&iacute;a</h5>
	<% foreach(var categoria in Model.CategoriasInvestigador) { %>
        <div id="estado_<%=Html.Encode(categoria.Id) %>" class="sublista">
            <h6><a href="<%=Url.Action("DeleteCategoria", null, new{id = categoria.Id, investigadorId = Model.Id}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
    	    <%=Html.Encode(categoria.CategoriaNombre)%> periodo <span><%=Html.Encode(categoria.FechaInicial)%> o <%=Html.Encode(categoria.FechaFinal)%></span></h6>
        </div><!--end estadolista-->
    <% } %>
    
    <div id="categoriaNew" class="minilistaboton">
		<p><span><%=Html.ActionLink("+ Nueva Categoria", "NewCategoria", new { Id = Model.Id }, new { @class = "remote get" })%></span></p>
	</div><!--end minilistaboton-->	
          
</div><!--end minilista-->

<div id="categoriaForm" class="display:hidden;"></div>