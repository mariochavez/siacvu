<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResponsableForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="responsableexternoList">
    <h5>Investigador Externo</h5>

    <% if (Model.ResponsablesExternos != null && Model.ResponsablesExternos.Length > 0) { %>
        <% for(int i = 0; i < Model.ResponsablesExternos.Length; i++) { %>
	        <div class="sublista" id="responsableexterno_<%=Html.Encode(Model.ResponsablesExternos[i].InvestigadorExternoId) %>">
	            <h6>
	                <a href="<%=Url.Action("deleteresponsableexterno", null, new{ id = Model.ModelId, investigadorExternoId = Model.ResponsablesExternos[i].InvestigadorExternoId}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
	                <%=Html.Encode(Model.ResponsablesExternos[i].InvestigadorExternoNombre)%>
	                <%=Html.Hidden("ResponsableExterno[" + i + "].InvestigadorExternoId", Model.ResponsablesExternos[i].InvestigadorExternoId)%>
	                <span>
                        Forma de participaci&oacute;n <%=Html.Encode(Model.ResponsablesExternos[i].FormaParticipacionNombre)%>
                        <%=Html.Hidden("ResponsableExterno[" + i + "].FormaParticipacionId", Model.ResponsablesExternos[i].FormaParticipacionId)%>
                    </span>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="responsableexternoEmptyListForm">
            <h6><span>No hay responsables externos registrados</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>

	<div id="responsableexternoNew" class="minilistaboton">
		<p>
			<span>
	    		<%=Html.ActionLink("+ Nuevo responsable externo", "NewResponsableExterno", new { Id = Model.ModelId }, new { @class = "remote get" })%>
			</span>
		</p>
	</div><!--end minilistaboton-->
	
</div><!--end minilista-->

<div id="responsableexternoForm" class="display:hidden;"></div>
