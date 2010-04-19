<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<DecisionesInteligentes.Colef.Sia.Web.Controllers.Models.BaseForm>" %>

<% if(Model.FirmaAceptacion2 == 1 || Model.FirmaAceptacion2 == 2) { %>
	<div class="mensaje-acierto">
		<% if(Model.FirmaAceptacion2 == 2){ %>
    		<p>Motivo del rechazo: <%=Html.Encode(Model.FirmaDescripcion)%></p>
		<% } %>
		<% if(Model.FirmaAceptacion2 == 1){ %>
    		<p>Producto firmado con <%=Html.Encode(Model.Puntuacion)%> puntos SIEVA</p>
		<% } %>
	</div>
<% } %>