<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div id="cargoList" class="minilista">
	<h5>Cargo</h5>
	<% foreach(var cargo in Model.CargosInvestigador) { %>
        <div id="estado_<%=Html.Encode(cargo.Id) %>" class="sublista">
    	    <h6><%=Html.Encode(cargo.CargoNombre)%> <span><%=Html.Encode(cargo.Fecha)%>, <%=Html.Encode(cargo.SedeNombre) %></span></h6>
    	    <span><%=Html.Encode(cargo.DepartamentoNombre) %></span>
        </div><!--end estadolista-->
    <% } %>
    
    <div id="cargo_new" class="minilistaboton">
		<p><span><%=Html.ActionLink("+ Nuevo cargo", "NewCargo", new { Id = Model.Id }, new { @class = "remote get" })%></span></p>
	</div><!--end minilistaboton-->	
          
</div><!--end minilista-->

<div id="cargo_form" class="display:hidden;"></div>