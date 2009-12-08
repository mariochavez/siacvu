<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ParticipanteForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="participanteexternoList">
    <h5>Investigador Externo</h5>

    <% if (Model.ParticipantesExternos != null && Model.ParticipantesExternos.Length > 0) { %>
        <% for(int i = 0; i < Model.ParticipantesExternos.Length; i++) { %>
	        <div class="sublista" id="participanteexterno_<%=Html.Encode(Model.ParticipantesExternos[i].InvestigadorExternoId) %>">
	            <h6>
	                <%=Html.Encode(Model.ParticipantesExternos[i].NombreCompleto)%>
	                <span>
                        Instituci&oacute;n <%=Html.Encode(Model.ParticipantesExternos[i].InstitucionNombre)%>
                    </span>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="participanteexternoEmptyList_form">
            <h6><span>No hay participantes externos registrados</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>

</div><!--end minilista-->