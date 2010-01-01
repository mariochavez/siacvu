<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CoautorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<% if (Model.CoautoresInternos == null && Model.CoautoresExternos == null) { %>
    <div class="sublista" id="coautorEmptyListForm">
        <h6><span>No hay investigadores registrados</span></h6>
    </div><!--end elementodescripcion-->
<% } %>