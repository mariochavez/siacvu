<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<h4>Actividad econ&oacute;mica</h4>
<p>
    <label>Sector econ&oacute;mico</label>
    <span id="span_sectoreconomico" class="valor"><%= Html.Encode(Model.ClaseRamaSectorEconomicoNombre)%>&nbsp;</span>
</p>
<p>
    <label>Rama</label>
    <span id="span_rama" class="valor"><%= Html.Encode(Model.ClaseRamaNombre)%>&nbsp;</span>
</p>
<% if(!Model.IsShowForm){ %>
    <p>
        <label>Clase</label>
        <%=Html.TextBox("ClaseNombre", Model.ClaseNombre,
                new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "Clase"), maxlength = 100 })%>
        <%=Html.Hidden("ClaseId", Model.ClaseId, new { rel = "#ClaseNombre", url = Url.Action("ChangeClase") })%>
        <span class="cvu"></span>
        <%=Html.ValidationMessage("ClaseNombre")%>
    </p>
<% } else { %>
    <p>
        <label>Clase</label>
        <span class="valor"><%= Html.Encode(Model.ClaseNombre)%>&nbsp;</span>
    </p>
<% } %>