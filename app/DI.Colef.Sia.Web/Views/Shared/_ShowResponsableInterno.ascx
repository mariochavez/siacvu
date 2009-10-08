<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResponsableForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="responsableinternoList">
    <h5>Investigador Interno</h5>

    <% if (Model.ResponsablesInternos != null && Model.ResponsablesInternos.Length > 0) { %>
        <% for(int i = 0; i < Model.ResponsablesInternos.Length; i++) { %>
	        <div class="sublista" id="responsableinterno_<%=Html.Encode(Model.ResponsablesInternos[i].InvestigadorId) %>">
	            <h6>
	                <%=Html.Encode(Model.ResponsablesInternos[i].NombreResponsable)%>
	                <span>
                        Posici&oacute;n <%=Html.Encode(Model.ResponsablesInternos[i].Posicion)%>
                    </span>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="responsableinternoEmptyList_form">
            <h6><span>No hay responsables internos registrados</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>

</div><!--end minilista-->