<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CoautorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="coautorexternoList">

    <% if (Model.CoautoresExternos != null && Model.CoautoresExternos.Length > 0) { %>
        <% for(int i = 0; i < Model.CoautoresExternos.Length; i++) { %>
	        <div class="sublista" id="coautorexterno_<%=Html.Encode(Model.CoautoresExternos[i].InvestigadorExternoId) %>">
	            <h6>
	                <%=Html.Encode(Model.CoautoresExternos[i].NombreCompleto)%>
	                <span>
	                    <% if (Model.CoautoresExternos[i].InstitucionId != 0) {%>
                            Instituci&oacute;n <%=Html.Encode(Model.CoautoresExternos[i].InstitucionNombre)%>
                        <% } %>
                        <% if(!Model.CoautorSeOrdenaAlfabeticamente){ %>
                            Posici&oacute;n <%=Html.Encode(Model.CoautoresExternos[i].Posicion)%>
                        <% } %>
                    </span>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } %>
	
</div><!--end minilista-->
