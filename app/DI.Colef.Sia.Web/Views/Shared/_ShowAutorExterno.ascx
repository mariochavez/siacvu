<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<AutorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="autorexternoList">
    <h5>Investigador Externo</h5>

    <% if (Model.AutoresExternos != null && Model.AutoresExternos.Length > 0) { %>
        <% for(int i = 0; i < Model.AutoresExternos.Length; i++) { %>
	        <div class="sublista" id="autorexterno_<%=Html.Encode(Model.AutoresExternos[i].InvestigadorExternoId) %>">
	            <h6>
	                <%=Html.Encode(Model.AutoresExternos[i].NombreCompleto)%>
	                <span>
                        Instituci&oacute;n <%=Html.Encode(Model.AutoresExternos[i].InstitucionNombre)%>
                    </span>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="autorexternoEmptyList_form">
            <h6><span>No hay autores externos registrados</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>

</div><!--end minilista-->