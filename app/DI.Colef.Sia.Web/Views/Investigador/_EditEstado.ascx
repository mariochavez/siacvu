<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div id="estadoList" class="minilista">
	<h5>Estado</h5>
	<% foreach(var estado in Model.EstadosInvestigador) { %>
        <div id="estado_<%=Html.Encode(estado.Id) %>" class="sublista">
    	    <h6><%=Html.Encode(estado.EstadoNombre) %> <span><%=Html.Encode(estado.Fecha) %></span></h6>
        </div><!--end estadolista-->
    <% } %>
    
    <div class="minilistaboton">
		<p><span><%=Html.ActionLink("+ Nuevo Estado", "NewEstado", new { Id = Model.Id }, new { @class = "remote get" })%></span></p>
	</div><!--end minilistaboton-->	
          
</div><!--end minilista-->
<div id="estado_form" class="display:hidden;"></div>
