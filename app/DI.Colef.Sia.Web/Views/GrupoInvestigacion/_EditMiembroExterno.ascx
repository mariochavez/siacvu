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
	                <a href="<%=Url.Action("DeleteMiembroExterno", null, new{ id = Model.Id, investigadorExternoId = Model.MiembroExternoGrupoInvestigaciones[i].InvestigadorExternoId}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
	                <%=Html.Encode(Model.MiembroExternoGrupoInvestigaciones[i].NombreCompleto)%>
	                <%=Html.Hidden("MiembroExterno[" + i + "].InvestigadorExternoId", Model.MiembroExternoGrupoInvestigaciones[i].InvestigadorExternoId)%>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="miembroexternoEmptyListForm">
            <h6><span>No hay miembros externos registrados</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>

	<div id="miembroexternoNew" class="minilistaboton">
		<p>
			<span>
	    		<%=Html.ActionLink("+ Agregar miembro externo", "NewMiembroExterno", new { Id = Model.Id }, new { @class = "remote get" })%>
			</span>
		</p>
	</div><!--end minilistaboton-->
	
</div><!--end minilista-->

<div id="miembroexternoForm" class="display:hidden;"></div>
