<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CoautorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="coautorinternoList">
    <h5>Investigador Interno</h5>

    <% if (Model.CoautoresInternos != null && Model.CoautoresInternos.Length > 0) { %>
        <% for(int i = 0; i < Model.CoautoresInternos.Length; i++) { %>
	        <div class="sublista" id="coautorinterno_<%=Html.Encode(Model.CoautoresInternos[i].InvestigadorId) %>">
	            <h6>
	                <a href="<%=Url.Action("deletecoautorinterno", null, new{id = Model.ModelId, investigadorId = Model.CoautoresInternos[i].InvestigadorId}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
	                <%=Html.Encode(Model.CoautoresInternos[i].NombreCoautor)%>
	                <%=Html.Hidden("CoautorInterno[" + i + "].InvestigadorId_New", Model.CoautoresInternos[i].InvestigadorId)%>
	                <span>
                        Posici&oacute;n <%=Html.Encode(Model.CoautoresInternos[i].Posicion)%>
                        <%=Html.Hidden("CoautorInterno[" + i + "].Posicion", Model.CoautoresInternos[i].Posicion)%>
                       </span>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="coautorinternoEmptyList_form">
            <h6><span>No hay coautores internos registrados</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>

	<div id="coautorinterno_new" class="minilistaboton">
		<p>
			<span>
	    		<%=Html.ActionLink("+ Nuevo coautor interno", "NewCoautorInterno", new { Id = Model.ModelId }, new { @class = "remote get" })%>
			</span>
		</p>
	</div><!--end minilistaboton-->

</div><!--end minilista-->

<div id="coautorinterno_form" class="display:hidden;"></div>