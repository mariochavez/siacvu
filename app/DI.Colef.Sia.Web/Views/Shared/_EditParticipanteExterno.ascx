<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ParticipanteForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="participanteexternoList">

    <% if (Model.ParticipantesExternos != null && Model.ParticipantesExternos.Length > 0) { %>
        <% for(int i = 0; i < Model.ParticipantesExternos.Length; i++) { %>
	        <div class="sublista" id="participanteexterno_<%=Html.Encode(Model.ParticipantesExternos[i].InvestigadorExternoId) %>">
	            <h6>
	                <a href="<%=Url.Action("DeleteParticipanteExterno", null, new{ id = Model.ModelId, investigadorExternoId = Model.ParticipantesExternos[i].InvestigadorExternoId}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
	                <%=Html.Encode(Model.ParticipantesExternos[i].NombreCompleto)%>
	                <%=Html.Hidden("ParticipanteExterno[" + i + "].InvestigadorExternoId", Model.ParticipantesExternos[i].InvestigadorExternoId)%>
	                <span>
	                    <% if (Model.ParticipantesExternos[i].InstitucionId != 0) {%>
                            Instituci&oacute;n <%=Html.Encode(Model.ParticipantesExternos[i].InstitucionNombre)%>
                            <%=Html.Hidden("ParticipanteExterno[" + i + "].InstitucionId", Model.ParticipantesExternos[i].InstitucionId)%>
                        <% } %>
                        <% if(!Model.ParticipanteSeOrdenaAlfabeticamente){ %>
                            Posici&oacute;n <%=Html.Encode(Model.ParticipantesExternos[i].Posicion)%>
                            <%=Html.Hidden("ParticipanteExterno[" + i + "].Posicion", Model.ParticipantesExternos[i].Posicion)%>                 
                        <% } %>
                        <%=Html.Hidden("ParticipanteExterno[" + i + "].ParticipanteSeOrdenaAlfabeticamente", Model.ParticipanteSeOrdenaAlfabeticamente)%>
                    </span>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div>
		</div>
    <% } %>
	
</div><!--end minilista-->