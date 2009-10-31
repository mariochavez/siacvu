<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<div class="minilista" id="institucioneventoList">
    <h5>Instituciones participantes</h5>

    <% if (Model.InstitucionEventos != null && Model.InstitucionEventos.Length > 0){ %>
        <% for (int i = 0; i < Model.InstitucionEventos.Length; i++){ %>
	        <div class="sublista" id="institucionevento_<%=Html.Encode(Model.InstitucionEventos[i].InstitucionId) %>">
	            <h6>
	                <%=Html.Encode(Model.InstitucionEventos[i].InstitucionNombre)%>
                     <span>
                        Objetivo del evento <%=Html.Encode(Model.InstitucionEventos[i].ObjetivoEvento)%>
                    </span>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="institucioneventoEmptyListForm">
            <h6><span>No hay instituciones registradas</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>

</div><!--end minilista-->