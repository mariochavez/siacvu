<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ParticipanteForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="participanteinternoList">

    <% if (Model.ParticipantesInternos != null && Model.ParticipantesInternos.Length > 0) { %>
        <% for(int i = 0; i < Model.ParticipantesInternos.Length; i++) { %>
	        <div class="sublista" id="participanteinterno_<%=Html.Encode(Model.ParticipantesInternos[i].InvestigadorId) %>">
	            <h6>
	                <%=Html.Encode(Model.ParticipantesInternos[i].NombreParticipante)%>
	                <% if(!Model.ParticipanteSeOrdenaAlfabeticamente){ %>
	                    <span>
                            Posici&oacute;n <%=Html.Encode(Model.ParticipantesInternos[i].Posicion)%>
                        </span>
                    <% } %>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } %>

</div><!--end minilista-->