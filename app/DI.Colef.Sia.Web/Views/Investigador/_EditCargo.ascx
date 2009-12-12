<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div id="cargoList" class="minilista">
	<h5>Cargo</h5>
	<% foreach(var cargo in Model.CargosInvestigador) { %>
        <div id="estado_<%=Html.Encode(cargo.Id) %>" class="sublista">
            <h6><a href="<%=Url.Action("DeleteCargo", null, new{id = cargo.Id, investigadorId = Model.Id}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
    	    <%=Html.Encode(cargo.PuestoNombre)%> <span><%=Html.Encode(cargo.SedeNombre) %></span></h6>
    	    <span><%=Html.Encode(cargo.DepartamentoNombre) %>, <%=Html.Encode(cargo.SedeDireccionRegionalNombre) %></span>
        </div><!--end estadolista-->
    <% } %>
    
    <div id="cargoNew" class="minilistaboton">
		<p><span><%=Html.ActionLink("+ Nuevo cargo", "NewCargo", new { Id = Model.Id }, new { @class = "remote get" })%></span></p>
	</div><!--end minilistaboton-->	
          
</div><!--end minilista-->

<div id="cargoForm" class="display:hidden;"></div>