<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<GrupoInvestigacionForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="miembroexternoList">
    <h5>Investigador Externo</h5>

    <% if (Model.MiembroExternoGrupoInvestigaciones != null && Model.MiembroExternoGrupoInvestigaciones.Length > 0)
       { %>
        <% for (int i = 0; i < Model.MiembroExternoGrupoInvestigaciones.Length; i++)
           { %>
	        <div class="sublista" id="miembroexterno_<%=Html.Encode(Model.MiembroExternoGrupoInvestigaciones[i].InvestigadorExternoId) %>">
	            <h6>
	                <%=Html.Encode(Model.MiembroExternoGrupoInvestigaciones[i].NombreCompleto)%>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="miembroexternoEmptyList_form">
            <h6><span>No hay miembros externos registrados</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>

</div><!--end minilista-->