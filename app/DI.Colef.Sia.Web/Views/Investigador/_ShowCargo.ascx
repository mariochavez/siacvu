<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div id="cargoList" class="minilista">
	<h5>Adscripci&oacute;n</h5>
	<% foreach(var cargo in Model.CargosInvestigador) { %>
        <div id="estado_<%=Html.Encode(cargo.Id) %>" class="sublista">
    	    <h6><%=Html.Encode(cargo.PuestoNombre)%> <span><%=Html.Encode(cargo.SedeNombre) %></span><%if(!String.IsNullOrEmpty(cargo.ComprobanteNombre)) { %> 
    	    Comprobante: <%=Html.ActionLink<ArchivoController>(x => x.Show(cargo.ComprobanteId), Html.Encode(cargo.ComprobanteNombre), new {target="_blank"})%> <% } %></h6>
    	    <span><%=Html.Encode(cargo.DepartamentoNombre) %>, <%=Html.Encode(cargo.SedeDireccionRegionalNombre)%></span>
        </div><!--end estadolista-->
    <% } %>      
</div><!--end minilista-->
