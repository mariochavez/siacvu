<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ParticipanteForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<div class="sublista" id="participanteEmptyListForm">
    <% if (Model.ParticipantesInternos.Length == 0 && Model.ParticipantesExternos.Length == 0) { %>
        <h6><span>No hay investigadores registrados</span></h6>
    <% } %>
</div><!--end elementodescripcion-->