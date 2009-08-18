<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="tipoparticipacionList">
    <h5>Tipo Participaci&oacute;n</h5>

    <% if (Model.TipoParticipacionEventos != null) { %>
        <% foreach (var tipoParticipacion in Model.TipoParticipacionEventos){ %>
	        <div class="sublista" id="tipoparticipacion_<%=Html.Encode(tipoParticipacion.Id) %>">
	            <h6><%=Html.Encode(tipoParticipacion.TipoParticipacionNombre)%></h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="tipoparticipacionEmptyList_form">
            <h6><span>No hay participaciones definida</span></h5>
		</div><!--end elementodescripcion-->
    <% } %>

	<div id="tipoparticipacion_new" class="minilistaboton">
		<p>
			<span>
	    		<%=Html.ActionLink("+ Nuevo Tipo Participación", "NewTipoParticipacion", new { Id = Model.Id }, new { @class = "remote get" })%>
			</span>
		</p>
	</div><!--end minilistaboton-->

</div><!--end minilista-->

<div id="tipoparticipacion_form" class="display:hidden;"></div>