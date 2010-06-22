<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>L&iacute;nea tem&aacute;tica</label>
    <span id="span_lineatematica" class="valor"><%= Html.Encode(Model.AreaTematicaLineaTematicaNombre) %>&nbsp;</span>
</p>
<% if(!Model.IsShowForm){ %>
    <p>
        <label>&Aacute;rea tem&aacute;tica</label>
        <%=Html.TextBox("AreaTematicaNombre", Model.AreaTematicaNombre,
                new { @class = "autocomplete buscar-requerido", url = Url.Action("Search", "AreaTematica"), maxlength = 100 })%>
        <%=Html.Hidden("AreaTematicaId", Model.AreaTematicaId, new { rel = "#AreaTematicaNombre", url = Url.Action("ChangeAreaTematica") })%>
        <%=Html.ValidationMessage("AreaTematicaNombre")%>
    </p>
<% } else { %>
    <p>
        <label>&Aacute;rea tem&aacute;tica</label>
        <span class="valor"><%= Html.Encode(Model.AreaTematicaNombre) %>&nbsp;</span>
    </p>
<% } %>