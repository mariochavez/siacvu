<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<div class="minilista" id="participanteexternoList">
    <h5>Investigador Externo</h5>

    <% if (Model.ParticipanteExternoProyectos != null && Model.ParticipanteExternoProyectos.Length > 0){ %>
        <% foreach (var participanteExterno in Model.ParticipanteExternoProyectos){ %>
	        <div class="sublista" id="participanteexterno_<%=Html.Encode(participanteExterno.InvestigadorExternoId) %>">
	            <h6>
	                <%=Html.Encode(participanteExterno.InvestigadorExternoNombre)%>
	                <% if(Model.Id == 0) { %>
	                    <%=Html.Hidden("ParticipanteExternoProyecto.InvestigadorExternoId_New", participanteExterno.InvestigadorExternoId)%>
	                <% } %>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="participanteexternoEmptyList_form">
            <h6><span>No hay participantes externos registrados</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>

	<div id="participanteexterno_new" class="minilistaboton">
		<p>
			<span>
		    	<%=Html.ActionLink("+ Nuevo participante externo", "NewParticipanteExterno", new { Id = Model.Id }, new { @class = "remote get" })%>
			</span>
		</p>
	</div><!--end minilistaboton-->

</div><!--end minilista-->
	
<div id="participanteexterno_form" class="display:hidden;"></div>