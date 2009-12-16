<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ParticipanteForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="participanteexternoList">
    <h5>Investigador Externo</h5>

    <% if (Model.ParticipantesExternos != null && Model.ParticipantesExternos.Length > 0) { %>
        <% for(int i = 0; i < Model.ParticipantesExternos.Length; i++) { %>
	        <div class="sublista" id="participanteexterno_<%=Html.Encode(Model.ParticipantesExternos[i].InvestigadorExternoId) %>">
	            <h6>
	                <a href="<%=Url.Action("DeleteParticipanteExterno", null, new{ id = Model.ModelId, investigadorExternoId = Model.ParticipantesExternos[i].InvestigadorExternoId}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
	                <%=Html.Encode(Model.ParticipantesExternos[i].NombreCompleto)%>
	                <%=Html.Hidden("ParticipanteExterno[" + i + "].InvestigadorExternoId", Model.ParticipantesExternos[i].InvestigadorExternoId)%>
	                <% if (Model.ParticipantesExternos[i].InstitucionId != 0) {%>
	                    <span>
                            Instituci&oacute;n <%=Html.Encode(Model.ParticipantesExternos[i].InstitucionNombre)%>
                            <%=Html.Hidden("ParticipanteExterno[" + i + "].InstitucionId", Model.ParticipantesExternos[i].InstitucionId)%>
                        </span>
                    <% } %>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="participanteexternoEmptyListForm">
            <h6><span>No hay participantes externos registrados</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>

	<div id="participanteexternoNew" class="minilistaboton">
		<p>
			<span>
	    		<%=Html.ActionLink("+ Agregar participante externo", "NewParticipanteExterno", new { Id = Model.ModelId }, new { @class = "remote get" })%>
			</span>
		</p>
	</div><!--end minilistaboton-->
	
</div><!--end minilista-->

<div id="participanteexternoForm" class="display:hidden;"></div>