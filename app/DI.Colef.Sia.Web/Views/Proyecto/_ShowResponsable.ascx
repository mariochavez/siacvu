<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="responsableList">
    <h5>Responsable</h5>
    <% if (Model.ResponsableProyectos != null && Model.ResponsableProyectos.Length > 0) { %>
        <% foreach(var responsable in Model.ResponsableProyectos) { %>
            <div class="sublista" id="responsable_<%=Html.Encode(responsable.InvestigadorId) %>">
                <h6> <%=Html.Encode(responsable.NombreResponsable)%></h6>
            </div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="responsableEmptyList_form">
            <h6><span>No hay responsables registrados</span></h6>
        </div><!--end elementodescripcion-->
    <% } %>
</div>