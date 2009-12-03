<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<div class="minilista" id="participanteinternoList">
    <h5>Investigador Interno</h5>

    <% if (Model.ParticipanteInternoProyectos != null && Model.ParticipanteInternoProyectos.Length > 0){ %>
        <% foreach (var participanteInterno in Model.ParticipanteInternoProyectos){ %>
	        <div class="sublista" id="participanteinterno_<%=Html.Encode(participanteInterno.InvestigadorId) %>">
	            <h6>
	                <%=Html.Encode(participanteInterno.NombreParticipante)%>
	                <% if(Model.Id == 0) { %>
	                    <%=Html.Hidden("ParticipanteInternoProyecto.InvestigadorId_New", participanteInterno.InvestigadorId)%>
	                <% } %>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="participanteinternoEmptyList_form">
            <h6><span>No hay participantes internos registrados</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>

	<div id="participanteinterno_new" class="minilistaboton">
		<p>
			<span>
		    	<%=Html.ActionLink("+ Nuevo participante interno", "NewParticipanteInterno", new { Id = Model.Id }, new { @class = "remote get" })%>
			</span>
		</p>
	</div><!--end minilistaboton-->

</div><!--end minilista-->
	
<div id="participanteinterno_form" class="display:hidden;"></div>