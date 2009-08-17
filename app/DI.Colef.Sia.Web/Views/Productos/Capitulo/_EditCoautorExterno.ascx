<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="form" id="coautorexternoList">
    <tr>
        <th class="subform">Coautor Externo</th>
    </tr>
    <% if (Model.CoautorExternoCapitulos != null){%>
        <% foreach(var coautorExterno in Model.CoautorExternoCapitulos) { %>
        <tr id="coautorexterno_<%=Html.Encode(coautorExterno.Id) %>">
            <td class="subform">
                <%=Html.Encode(coautorExterno.InvestigadorExternoNombre)%>
            </td>
        </tr>
        <% } %>
    <% } else { %>
        <tr id="coautorexternoEmptyList_form">
            <td class="subform">
                No hay coautores externos definido</span></h5></div><!--end elementodescripcion-->
    <% } %>
    
    

<div id="coautorexterno_new" class="floatl btn_container">
    
	    <%=Html.ActionLink("+ Nuevo Coautor Externo", "NewCoautorExterno", new { Id = Model.Id }, new { @class = "remote get" })%>
	</span>
</div>
<div id="coautorexterno_form" class="display:hidden;"></div>