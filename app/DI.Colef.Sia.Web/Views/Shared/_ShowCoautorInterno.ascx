<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CoautorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="coautorinternoList">
    <h5>Investigador Interno</h5>

    <% if (Model.CoautoresInternos != null && Model.CoautoresInternos.Length > 0) { %>
        <% for(int i = 0; i < Model.CoautoresInternos.Length; i++) { %>
	        <div class="sublista" id="coautorinterno_<%=Html.Encode(Model.CoautoresInternos[i].InvestigadorId) %>">
	            <h6>
	                <%=Html.Encode(Model.CoautoresInternos[i].NombreCoautor)%>
	                <span>
                        Posici&oacute;n <%=Html.Encode(Model.CoautoresInternos[i].Posicion)%>
                        </span>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="coautorinternoEmptyList_form">
            <h6><span>No hay coautores internos registrados</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>

</div><!--end minilista-->