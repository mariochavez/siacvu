<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ParticipanteForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="participanteinternoList">
    <h5>Investigador Interno</h5>

    <% if (Model.ParticipantesInternos != null && Model.ParticipantesInternos.Length > 0) { %>
        <% for(int i = 0; i < Model.ParticipantesInternos.Length; i++) { %>
	        <div class="sublista" id="participanteinterno_<%=Html.Encode(Model.ParticipantesInternos[i].InvestigadorId) %>">
	            <h6>
	                <a href="<%=Url.Action("DeleteParticipanteInterno", null, new{id = Model.ModelId, investigadorId = Model.ParticipantesInternos[i].InvestigadorId}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
	                <%=Html.Encode(Model.ParticipantesInternos[i].NombreParticipante)%>
	                <%=Html.Hidden("ParticipanteInterno[" + i + "].InvestigadorId", Model.ParticipantesInternos[i].InvestigadorId)%>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="participanteinternoEmptyListForm">
            <h6><span>No hay participantes internos registrados</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>

	<div id="participanteinternoNew" class="minilistaboton">
		<p>
			<span>
	    		<%=Html.ActionLink("+ Agregar participante interno", "NewParticipanteInterno", new { Id = Model.ModelId }, new { @class = "remote get" })%>
			</span>
		</p>
	</div><!--end minilistaboton-->

</div><!--end minilista-->

<div id="participanteinternoForm" class="display:hidden;"></div>