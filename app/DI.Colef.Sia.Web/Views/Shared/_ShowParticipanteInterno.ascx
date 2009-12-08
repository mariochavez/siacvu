<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ParticipanteForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="participanteinternoList">
    <h5>Investigador Interno</h5>

    <% if (Model.ParticipantesInternos != null && Model.ParticipantesInternos.Length > 0) { %>
        <% for(int i = 0; i < Model.ParticipantesInternos.Length; i++) { %>
	        <div class="sublista" id="participanteinterno_<%=Html.Encode(Model.ParticipantesInternos[i].InvestigadorId) %>">
	            <h6>
	                <%=Html.Encode(Model.ParticipantesInternos[i].NombreParticipante)%>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="participanteinternoEmptyList_form">
            <h6><span>No hay participantes internos registrados</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>

</div><!--end minilista-->