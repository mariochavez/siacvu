<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ArticuloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="form" id="coautorinternoList">
    <tr>
        <th class="subform">Coautor Interno</th>
    </tr>
    <% if (Model.CoautorInternoArticulos != null){%>
        <% foreach(var coautorInterno in Model.CoautorInternoArticulos) { %>
        <tr id="coautorinterno_<%=Html.Encode(coautorInterno.Id) %>">
            <td class="subform">
                <%=Html.Encode(coautorInterno.InvestigadorUsuarioPersonaNombre)%>
            </td>
        </tr>
        <% } %>
    <% } else { %>
        <tr id="coautorinternoEmptyList_form">
            <td class="subform">
                No hay coautores internos definido</span></h5></div><!--end elementodescripcion-->
    <% } %>

<div id="coautorinterno_new" class="floatl btn_container">
    
	    <%=Html.ActionLink("+ Nuevo Coautor Interno", "NewCoautorInterno", new { Id = Model.Id }, new { @class = "remote get" })%>
	</span>
</div>
<div id="coautorinterno_form" class="display:hidden;"></div>