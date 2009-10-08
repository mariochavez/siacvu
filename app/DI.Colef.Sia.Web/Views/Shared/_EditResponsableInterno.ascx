<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResponsableForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="responsableinternoList">
    <h5>Investigador Interno</h5>

    <% if (Model.ResponsablesInternos != null && Model.ResponsablesInternos.Length > 0) { %>
        <% for(int i = 0; i < Model.ResponsablesInternos.Length; i++) { %>
	        <div class="sublista" id="responsableinterno_<%=Html.Encode(Model.ResponsablesInternos[i].InvestigadorId) %>">
	            <h6>
	                <a href="<%=Url.Action("deleteresponsableinterno", null, new{id = Model.ModelId, investigadorId = Model.ResponsablesInternos[i].InvestigadorId}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
	                <%=Html.Encode(Model.ResponsablesInternos[i].NombreResponsable)%>
	                <%=Html.Hidden("ResponsableInterno[" + i + "].InvestigadorId", Model.ResponsablesInternos[i].InvestigadorId)%>
	                <span>
                        Posici&oacute;n <%=Html.Encode(Model.ResponsablesInternos[i].Posicion)%>
                        <%=Html.Hidden("ResponsableInterno[" + i + "].Posicion", Model.ResponsablesInternos[i].Posicion)%>
                    </span>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="responsableinternoEmptyListForm">
            <h6><span>No hay responsables internos registrados</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>

	<div id="responsableinternoNew" class="minilistaboton">
		<p>
			<span>
	    		<%=Html.ActionLink("+ Nuevo responsable interno", "NewResponsableInterno", new { Id = Model.ModelId }, new { @class = "remote get" })%>
			</span>
		</p>
	</div><!--end minilistaboton-->

</div><!--end minilista-->

<div id="responsableinternoForm" class="display:hidden;"></div>