<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="responsableexternoList">
    <h5>Responsable externo</h5>

    <% if (Model.ResponsableExternoCapitulos != null && Model.ResponsableExternoCapitulos.Length > 0) { %>
        <% foreach(var responsableExterno in Model.ResponsableExternoCapitulos) { %>
	        <div class="sublista" id="responsableexterno_<%=Html.Encode(responsableExterno.InvestigadorExternoId) %>">
	            <h6>
	                <%=Html.Encode(responsableExterno.InvestigadorExternoNombre)%>
	                <% if(Model.Id == 0) { %>
	                    <%=Html.Hidden("ResponsableExternoCapitulo.InvestigadorExternoId_New", responsableExterno.InvestigadorExternoId)%>
	                <% } %>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="responsableexternoEmptyList_form">
            <h6><span>No hay responsables externos registrados</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>

	<div id="responsableexterno_new" class="minilistaboton">
		<p>
			<span>
	    		<%=Html.ActionLink("+ Nuevo responsable externo", "NewResponsableExterno", new { Id = Model.Id }, new { @class = "remote get" })%>
			</span>
		</p>
	</div><!--end minilistaboton-->

</div><!--end minilista-->

<div id="responsableexterno_form" class="display:hidden;"></div>