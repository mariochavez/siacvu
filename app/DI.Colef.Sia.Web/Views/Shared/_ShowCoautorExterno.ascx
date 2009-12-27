<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CoautorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="coautorexternoList">
    <h5>Investigador Externo</h5>

    <% if (Model.CoautoresExternos != null && Model.CoautoresExternos.Length > 0) { %>
        <% for(int i = 0; i < Model.CoautoresExternos.Length; i++) { %>
	        <div class="sublista" id="coautorexterno_<%=Html.Encode(Model.CoautoresExternos[i].InvestigadorExternoId) %>">
	            <h6>
	                <%=Html.Encode(Model.CoautoresExternos[i].NombreCompleto)%>
	                <span>
                        Instituci&oacute;n <%=Html.Encode(Model.CoautoresExternos[i].InstitucionNombre)%>
                    </span>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="coautorexternoEmptyList_form">
            <h6><span>No hay investigadores externos registrados</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>

</div><!--end minilista-->