<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<% if(!Model.IsShowForm){ %>
    <p>
        <label><%= Html.Encode(Model.InstitucionLabel) %></label>
        <%=Html.TextBox("InstitucionNombre", Model.InstitucionNombre,
                new { @class = "autocomplete buscar-requerido", url = Url.Action("Search", "Institucion"), maxlength = 100 })%>
        <%=Html.Hidden("InstitucionId", Model.InstitucionId, new { rel = "#InstitucionNombre", url = Url.Action("ChangeInstitucionShort") })%>
        <%=Html.ValidationMessage("InstitucionNombre")%>
    </p>
<% } else { %>
    <p>
        <label><%= Html.Encode(Model.InstitucionLabel) %></label>
        <span id="span_institucion" class="valor"><%= Html.Encode(Model.InstitucionNombre)%>&nbsp;</span>
    </p>
<% } %>
<p>
    <label>Pa&iacute;s</label>
    <span id="span_pais" class="valor"><%= Html.Encode(Model.InstitucionPaisNombre)%>&nbsp;</span>
</p>