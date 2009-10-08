<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResponsableForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="responsableexternoList">
    <h5>Investigador Externo</h5>

    <% if (Model.ResponsablesExternos != null && Model.ResponsablesExternos.Length > 0) { %>
        <% for(int i = 0; i < Model.ResponsablesExternos.Length; i++) { %>
	        <div class="sublista" id="responsableexterno_<%=Html.Encode(Model.ResponsablesExternos[i].InvestigadorExternoId) %>">
	            <h6>
	                <%=Html.Encode(Model.ResponsablesExternos[i].InvestigadorExternoNombre)%>
	                <span>
                        Forma de participaci&oacute;n <%=Html.Encode(Model.ResponsablesExternos[i].FormaParticipacionNombre)%>
                    </span>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="responsableexternoEmptyList_form">
            <h6><span>No hay responsables externos registrados</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>

</div><!--end minilista-->