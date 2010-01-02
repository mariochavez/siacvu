<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<AutorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<div class="sublista" id="autorEmptyListForm">
    <% if (Model.AutoresInternos.Length == 0 && Model.AutoresExternos.Length == 0) { %>
        <h6><span>No hay investigadores registrados</span></h6>
    <% } %>
</div><!--end elementodescripcion-->