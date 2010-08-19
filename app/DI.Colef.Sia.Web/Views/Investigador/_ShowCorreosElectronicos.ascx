<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IList<CorreoElectronicoForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<div class="minilista">
    <% if (Model.Count > 0) {%>
	    <h5>Correos Electr&oacute;nicos</h5>
    <% }%>
    <% foreach(var correoElectronicoForm in Model) { %>
        <div class="sublista">
            <h6><%= Html.Encode(correoElectronicoForm.Direccion) %></h6><br />
        </div>
    <% } %>
</div>