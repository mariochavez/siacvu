<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div id="cargoList" class="minilista">
	<h5>Cargo</h5>
	<% foreach(var cargo in Model.CargosInvestigador) { %>
        <div id="estado_<%=Html.Encode(cargo.Id) %>" class="sublista">
    	    <h6><%=Html.Encode(cargo.PuestoNombre)%> <span><%=Html.Encode(cargo.SedeNombre) %></span></h6>
    	    <span><%=Html.Encode(cargo.DepartamentoNombre) %>, <%=Html.Encode(cargo.SedeDireccionGeneralNombre) %></span>
        </div><!--end estadolista-->
    <% } %>      
</div><!--end minilista-->
