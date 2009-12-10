<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div id="sesionList" class="minilista">
	<h5>Sesion(es) del evento estrat&eacute;gico</h5>
	<% if (Model.SesionEventos != null && Model.SesionEventos.Length > 0) { %>
	    <% foreach(var sesion in Model.SesionEventos) { %>
            <div id="estado_<%=Html.Encode(sesion.Id) %>" class="sublista">
    	        <h6><%=Html.Encode(sesion.NombreSesion)%> <span><%=Html.Encode(sesion.ObjetivoSesion)%></span></h6>
    	        <span><%=Html.Encode(sesion.AmbitoNombre)%>, <%=Html.Encode(sesion.FechaEvento)%>, <%=Html.Encode(sesion.Lugar)%></span>
            </div><!--end estadolista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="sesionEmptyList_form">
            <h6><span>No hay sesiones del evento estrat&eacute;gico registradas</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>
</div><!--end minilista-->