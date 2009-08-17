<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<LibroForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>	
	<table class="form" id="coautorinternoList">
    <tr>
        <th class="subform">Coautores Internos</th>
    </tr>
    <% if (Model.CoautorInternoLibros != null){%>
        <% foreach(var coautorInterno in Model.CoautorInternoLibros) { %>
        <tr id="coautorinterno_<%=Html.Encode(coautorInterno.Id) %>">
            <td class="subform">
                <%=Html.Encode(coautorInterno.InvestigadorUsuarioPersonaNombre)%>
            </td>
        </tr>
        <% } %>
    <% } else { %>
        <tr id="coautorinternoEmptyList_form">
            <td class="subform">
                No hay Coautores Internos definido</span></h5></div><!--end elementodescripcion-->
    <% } %>

<div id="coautorinterno_new" class="floatl btn_container">
    
	    <%=Html.ActionLink("+ Nuevo Coautor Interno", "NewCoautorInterno", new { Id = Model.Id }, new { @class = "remote get" })%>
	</span>
</div>
<div id="coautorinterno_form" class="display:hidden;"></div>
	