<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div id="sesionList" class="minilista">
	<h5>Sesion de evento</h5>
	<% foreach(var sesion in Model.SesionEventos) { %>
        <div id="estado_<%=Html.Encode(sesion.Id) %>" class="sublista">
    	    <h6><%=Html.Encode(sesion.NombreSesion)%> <span><%=Html.Encode(sesion.ObjetivoSesion)%>, <%=Html.Encode(sesion.AmbitoNombre)%></span></h6>
    	    <span><%=Html.Encode(sesion.FechaEvento)%>, <%=Html.Encode(sesion.Lugar)%></span>
        </div><!--end estadolista-->
    <% } %>      
</div><!--end minilista-->