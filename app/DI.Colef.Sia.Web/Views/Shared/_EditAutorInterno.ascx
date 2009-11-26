<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<AutorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="autorinternoList">
    <h5>Investigador Interno</h5>

    <% if (Model.AutoresInternos != null && Model.AutoresInternos.Length > 0) { %>
        <% for(int i = 0; i < Model.AutoresInternos.Length; i++) { %>
	        <div class="sublista" id="autorinterno_<%=Html.Encode(Model.AutoresInternos[i].InvestigadorId) %>">
	            <h6>
	                <a href="<%=Url.Action("DeleteAutorInterno", null, new{id = Model.ModelId, investigadorId = Model.AutoresInternos[i].InvestigadorId}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
	                <%=Html.Encode(Model.AutoresInternos[i].NombreAutor)%>
	                <%=Html.Hidden("AutorInterno[" + i + "].InvestigadorId", Model.AutoresInternos[i].InvestigadorId)%>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="autorinternoEmptyListForm">
            <h6><span>No hay autores internos registrados</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>

	<div id="autorinternoNew" class="minilistaboton">
		<p>
			<span>
	    		<%=Html.ActionLink("+ Nuevo autor interno", "NewAutorInterno", new { Id = Model.ModelId }, new { @class = "remote get" })%>
			</span>
		</p>
	</div><!--end minilistaboton-->

</div><!--end minilista-->

<div id="autorinternoForm" class="display:hidden;"></div>