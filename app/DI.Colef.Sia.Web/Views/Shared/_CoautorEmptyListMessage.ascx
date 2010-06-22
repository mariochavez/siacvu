<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CoautorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<div class="sublista" id="coautorEmptyListForm">
    <% if (Model.CoautoresInternos.Length == 0 && Model.CoautoresExternos.Length == 0) { %>
        <h6><span>No hay investigadores registrados</span></h6>
    <% } %>
</div><!--end elementodescripcion-->