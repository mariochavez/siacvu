<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<% if(!Model.IsShowForm){ %>
    <p>
        <label>&Aacute;rea tem&aacute;tica</label>
        <%=Html.TextBox("AreaTematicaNombre", Model.AreaTematicaNombre,
                new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "AreaTematica"), maxlength = 100 })%>
        <%=Html.Hidden("AreaTematicaId", Model.AreaTematicaId, new { rel = "#AreaTematicaNombre"})%>
        <%=Html.ValidationMessage("AreaTematicaNombre")%>
    </p>
    <p>
        <label>Palabra clave 1</label>
        <%=Html.TextBox("AreaTematicaPalabraClave1Nombre", Model.AreaTematicaPalabraClave1Nombre, new { @class = "input250", maxlength = 50 })%>
        <span class="cvu"></span>
    </p>
    <p>
        <label>Palabra clave 2</label>
        <%=Html.TextBox("AreaTematicaPalabraClave2Nombre", Model.AreaTematicaPalabraClave2Nombre, new { @class = "input250", maxlength = 50 })%>
        <span class="cvu"></span>
    </p>
    <p>
        <label>Palabra clave 3</label>
        <%=Html.TextBox("AreaTematicaPalabraClave3Nombre", Model.AreaTematicaPalabraClave3Nombre, new { @class = "input250", maxlength = 50 })%>
        <span class="cvu"></span>
    </p>
<% } else { %>
    <p>
        <label>&Aacute;rea tem&aacute;tica</label>
        <span class="valor"><%= Html.Encode(Model.AreaTematicaNombre) %>&nbsp;</span>
    </p>
    <p>
        <label>Palabra clave 1</label>
        <span class="valor"><%= Html.Encode(Model.AreaTematicaPalabraClave1Nombre)%>&nbsp;</span>
    </p>
    <p>
        <label>Palabra clave 2</label>
        <span class="valor"><%= Html.Encode(Model.AreaTematicaPalabraClave2Nombre)%>&nbsp;</span>
    </p>
    <p>
        <label>Palabra clave 3</label>
        <span class="valor"><%= Html.Encode(Model.AreaTematicaPalabraClave3Nombre)%>&nbsp;</span>
    </p>
<% } %>