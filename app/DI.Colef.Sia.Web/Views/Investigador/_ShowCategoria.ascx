<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div id="categoriaList" class="minilista">
	<h5>Categor&iacute;a</h5>
	<% foreach(var categoria in Model.CategoriasInvestigador) { %>
        <div id="estado_<%=Html.Encode(categoria.Id) %>" class="sublista">
    	    <h6><%=Html.Encode(categoria.CategoriaNombre)%> <span><%=Html.Encode(categoria.FechaInicial)%> a <%=Html.Encode(categoria.FechaFinal)%></span>
    	    <%if (!String.IsNullOrEmpty(categoria.ComprobanteNombre)){ %> 
    	    Comprobante: <%=Html.ActionLink<ArchivoController>(x => x.Show(categoria.ComprobanteId), Html.Encode(categoria.ComprobanteNombre), new { target = "_blank" })%> <% } %></h6>
        </div><!--end estadolista-->
    <% } %>
</div><!--end minilista-->
