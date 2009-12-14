<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div id="sniList" class="minilista">
	<h5>SNI</h5>
	<% foreach(var sni in Model.SNIsInvestigador) { %>
        <div id="estado_<%=Html.Encode(sni.Id) %>" class="sublista">
    	    <h6><%=Html.Encode(sni.SNINombre)%> <%if(sni.SNINombre != "No pertence") { %> <span><%=Html.Encode(sni.FechaInicial) %> <% if(sni.SNINombre != "Emerito") { %> a <%=Html.Encode(sni.FechaFinal) %><% } %></span> <% } %>
    	    <%if(!String.IsNullOrEmpty(sni.ComprobanteNombre)) { %> 
    	    Comprobante: <%=Html.ActionLink<ArchivoController>(x => x.Show(sni.ComprobanteId), sni.ComprobanteNombre, new {target="_blank"})%> <% } %></h6>
        </div><!--end estadolista-->
    <% } %>
</div><!--end minilista-->