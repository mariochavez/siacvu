<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="tipoparticipacionList">
    <h5>Tipo de participaci&oacute;n</h5>

    <% if (Model.TipoParticipacionEventos != null && Model.TipoParticipacionEventos.Length > 0) { %>
        <% foreach (var tipoParticipacion in Model.TipoParticipacionEventos){ %>
	        <div class="sublista" id="tipoparticipacion_<%=Html.Encode(tipoParticipacion.TipoParticipacionId) %>">
	            <h6>
	                <%=Html.Encode(tipoParticipacion.TipoParticipacionNombre)%>
                    <% if(Model.Id == 0) { %>
                        <%=Html.Hidden("TipoParticipacionEvento.TipoParticipacionId_New", tipoParticipacion.TipoParticipacionId)%>
                    <% } %>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="tipoparticipacionEmptyList_form">
            <h6><span>No hay tipos de participaciones registradas</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>

	<div id="tipoparticipacion_new" class="minilistaboton">
		<p>
			<span>
	    		<%=Html.ActionLink("+ Nuevo tipo de participación", "NewTipoParticipacion", new { Id = Model.Id }, new { @class = "remote get" })%>
			</span>
		</p>
	</div><!--end minilistaboton-->

</div><!--end minilista-->

<div id="tipoparticipacion_form" class="display:hidden;"></div>