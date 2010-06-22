<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ParticipanteForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="participanteinternoList">

    <% if (Model.ParticipantesInternos != null && Model.ParticipantesInternos.Length > 0) { %>
        <% for(int i = 0; i < Model.ParticipantesInternos.Length; i++) { %>
	        <div class="sublista" id="participanteinterno_<%=Html.Encode(Model.ParticipantesInternos[i].InvestigadorId) %>">
	            <h6>
	                <a href="<%=Url.Action("DeleteParticipanteInterno", null, new{id = Model.ModelId, investigadorId = Model.ParticipantesInternos[i].InvestigadorId}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
	                <%=Html.Encode(Model.ParticipantesInternos[i].NombreParticipante)%>
	                <%=Html.Hidden("ParticipanteInterno[" + i + "].InvestigadorId", Model.ParticipantesInternos[i].InvestigadorId)%>
	                <% if(!Model.ParticipanteSeOrdenaAlfabeticamente){ %>
	                    <span>
                            Posici&oacute;n <%=Html.Encode(Model.ParticipantesInternos[i].Posicion)%>
                            <%=Html.Hidden("ParticipanteInterno[" + i + "].Posicion", Model.ParticipantesInternos[i].Posicion)%>
                        </span>
                    <% } %>
                    <%=Html.Hidden("ParticipanteInterno[" + i + "].ParticipanteSeOrdenaAlfabeticamente", Model.ParticipanteSeOrdenaAlfabeticamente)%>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div>
		</div>
    <% } %>

</div><!--end minilista-->