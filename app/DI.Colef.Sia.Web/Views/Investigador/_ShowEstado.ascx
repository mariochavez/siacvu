<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div id="estadoList" class="minilista">
	<h5>Estatus</h5>
	<% foreach(var estado in Model.EstadosInvestigador) { %>
        <div id="estado_<%=Html.Encode(estado.Id) %>" class="sublista">
    	    <h6><%=Html.Encode(estado.EstadoNombre) %>
    	    <span><%=Html.Encode(estado.FechaInicial)%> <%if (estado.EstadoNombre != "Activo" || estado.EstadoNombre != "Baja") { %> a <%=Html.Encode(estado.FechaFinal)%><% } %></span></h6>
        </div><!--end estadolista-->
    <% } %>    
</div><!--end minilista-->
