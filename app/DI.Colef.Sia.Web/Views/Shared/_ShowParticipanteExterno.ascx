<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ParticipanteForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<div class="minilista" id="participanteexternoList">

    <% if (Model.ParticipantesExternos != null && Model.ParticipantesExternos.Length > 0) { %>
        <% for(int i = 0; i < Model.ParticipantesExternos.Length; i++) { %>
	        <div class="sublista" id="participanteexterno_<%=Html.Encode(Model.ParticipantesExternos[i].InvestigadorExternoId) %>">
	            <h6>
	                <%=Html.Encode(Model.ParticipantesExternos[i].NombreCompleto)%>
	                <span>
	                    <% if (Model.ParticipantesExternos[i].InstitucionId != 0) {%>
                            Instituci&oacute;n <%=Html.Encode(Model.ParticipantesExternos[i].InstitucionNombre)%>
                        <% } %>
                        <% if(!Model.ParticipanteSeOrdenaAlfabeticamente){ %>
                            Posici&oacute;n <%=Html.Encode(Model.ParticipantesExternos[i].Posicion)%>
                        <% } %>
                    </span>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } %>
	
</div><!--end minilista-->