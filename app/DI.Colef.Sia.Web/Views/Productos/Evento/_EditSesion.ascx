<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div id="sesionList" class="minilista">
	<h5>Sesion de evento</h5>
	<% foreach(var sesion in Model.SesionEventos) { %>
        <div id="estado_<%=Html.Encode(sesion.Id) %>" class="sublista">
            <h6><a href="<%=Url.Action("DeleteSesion", null, new{id = sesion.Id, eventoId = Model.Id}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
    	    <%=Html.Encode(sesion.NombreSesion)%> <span><%=Html.Encode(sesion.ObjetivoSesion)%></span></h6>
    	    <span><%=Html.Encode(sesion.AmbitoNombre)%>, <%=Html.Encode(sesion.FechaEvento)%></span>
    	    <span><%=Html.Encode(sesion.Lugar)%></span>
        </div><!--end estadolista-->
    <% } %>
    
    <div id="sesionNew" class="minilistaboton">
		<p><span><%=Html.ActionLink("+ Nueva sesión", "NewSesion", new { Id = Model.Id }, new { @class = "remote get" })%></span></p>
	</div><!--end minilistaboton-->	
          
</div><!--end minilista-->

<div id="sesionForm" class="display:hidden;"></div>