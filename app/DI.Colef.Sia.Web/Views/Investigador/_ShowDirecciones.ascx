<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IList<DireccionForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<div class="minilista">
    <% if (Model.Count > 0) { %>
	    <h5>Direcciones</h5>
    <% } %>
    <% foreach(var direccionForm in Model) { %>
        <div class="sublista">
            <h6>
                <%= Html.Encode(direccionForm.LineaDireccion) %>, <%= Html.Encode(direccionForm.Ciudad) %>, 
                <%= Html.Encode(direccionForm.EstadoPaisNombre) %>, <%= Html.Encode(direccionForm.PaisNombre) %>
            </h6><br />
        </div>
    <% } %>
</div>