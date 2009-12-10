<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div id="sesionList" class="minilista">
	<% if (Model.SesionEventos != null && Model.SesionEventos.Length > 0) { %>
        <% for (int i = 0; i < Model.SesionEventos.Length; i++){ %>
	        <div class="sublista" id="estado_<%=Html.Encode(Model.SesionEventos[i].NombreSesion.Replace(" ", "_")) %>">
	            <h5>Sesi&oacute;n <%= i + 1 %></h5>
	            <p>
                    <label>Nombre de la sesi&oacute;n</label>
                    <span class="valor"><%= Html.Encode(Model.SesionEventos[i].NombreSesion)%>&nbsp;</span>
                </p>
                <p>
                    <label>Objetivo de la sesi&oacute;n</label>
                    <span class="valor"><%= Html.Encode(Model.SesionEventos[i].ObjetivoSesion)%>&nbsp;</span>
                </p>
                <p>
                    <label>&Aacute;mbito</label>
                    <span class="valor"><%= Html.Encode(Model.SesionEventos[i].AmbitoNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Fecha del evento</label>
                    <span class="valor"><%= Html.Encode(Model.SesionEventos[i].FechaEvento)%>&nbsp;</span>
                </p>
                <p>
                    <label>Lugar (Ciudad/Estado)</label>
                    <span class="valor"><%= Html.Encode(Model.SesionEventos[i].Lugar)%>&nbsp;</span>
                </p>

                <h4>Participantes y logros de la sesi&oacute;n</h4>

                <p>
                    <label>Principales logros de la sesi&oacute;n</label>
                    <span class="valor"><%= Html.Encode(Model.SesionEventos[i].Logros)%>&nbsp;</span>
                </p>
                <p></p>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="sesionEmptyList_form">
            <h6><span>No hay sesiones del evento estrat&eacute;gico registradas</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>
</div><!--end minilista-->