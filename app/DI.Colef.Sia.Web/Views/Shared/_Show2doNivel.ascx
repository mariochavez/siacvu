<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<h4>Estructura funcional</h4>
<p>
    <label>Sector</label>
    <span id="span_sector" class="valor"><%= Html.Encode(Model.Nivel2OrganizacionSectorNombre)%>&nbsp;</span>
</p>
<p>
    <label>Organizaci&oacute;n</label>
    <span id="span_organizacion" class="valor"><%= Html.Encode(Model.Nivel2OrganizacionNombre)%>&nbsp;</span>
</p>
<% if(!Model.IsShowForm){ %>
    <p>
        <label>2do Nivel</label>
        <%=Html.TextBox("Nivel2Nombre", Model.Nivel2Nombre,
            new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "Nivel"), maxlength = 100 }) %>
        <%=Html.Hidden("Nivel2Id", Model.Nivel2Id, new { rel = "#Nivel2Nombre", url = Url.Action("ChangeNivel") })%>
        <span class="cvu"></span>
        <%=Html.ValidationMessage("Nivel2Nombre")%>
    </p>
<% } else { %>
    <p>
        <label>2do. Nivel</label>
        <span class="valor"><%= Html.Encode(Model.Nivel2Nombre)%>&nbsp;</span>
    </p>
<% } %>