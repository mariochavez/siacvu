<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IList<TelefonoForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<div class="minilista">
    <% if (Model.Count > 0) { %>
	    <h5>Telefonos</h5>
    <% }%>
    <% foreach(var telefonoForm in Model) { %>
        <div class="sublista">
            <h6><%= Html.Encode(telefonoForm.Numero) %></h6><br />
        </div>
    <% } %>
</div>