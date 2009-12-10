<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="responsableList">
    <h5>Responsables</h5>

    <% if (Model.ResponsableProyectos != null && Model.ResponsableProyectos.Length > 0){ %>
        <% for (int i = 0; i < Model.ResponsableProyectos.Length; i++){ %>
	        <div class="sublista" id="reponsable_<%=Html.Encode(Model.ResponsableProyectos[i].InvestigadorId) %>">
	            <h6>
	                <a href="<%=Url.Action("DeleteResponsable", null, new{id = Model.Id, investigadorId = Model.ResponsableProyectos[i].InvestigadorId}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
	                <%=Html.Encode(Model.ResponsableProyectos[i].NombreResponsable)%>
	                <%=Html.Hidden("Reponsable[" + i + "].InvestigadorId", Model.ResponsableProyectos[i].InvestigadorId)%>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="responsableEmptyListForm">
            <h6><span>No hay responsables registrados</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>

	<div id="responsableNew" class="minilistaboton">
		<p>
			<span>
		    	<%=Html.ActionLink("+ Nuevo responsable", "NewResponsable", new { Id = Model.Id }, new { @class = "remote get" })%>
			</span>
		</p>
	</div><!--end minilistaboton-->

</div><!--end minilista-->
	
<div id="responsableForm" class="display:hidden;"></div>