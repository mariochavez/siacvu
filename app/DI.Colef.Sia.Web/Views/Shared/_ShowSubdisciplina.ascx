<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<h4>&Aacute;rea del conocimiento</h4>
<p>
    <label>&Aacute;rea</label>
    <span id="span_area" class="valor"><%= Html.Encode(Model.SubdisciplinaDisciplinaAreaNombre)%>&nbsp;</span>
</p>
<p>
    <label>Disciplina</label>
    <span id="span_disciplina" class="valor"><%= Html.Encode(Model.SubdisciplinaDisciplinaNombre)%>&nbsp;</span>
</p>
<% if(!Model.IsShowForm){ %>
    <p>
        <label>Subdisciplina</label>
        <%=Html.TextBox("SubdisciplinaNombre", Model.SubdisciplinaNombre,
            new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "Subdisciplina"), maxlength = 100 })%>
        <%=Html.Hidden("SubdisciplinaId", Model.SubdisciplinaId, new { rel = "#SubdisciplinaNombre", url = Url.Action("ChangeSubdisciplina") })%>
        <span class="cvu"></span>
        <%=Html.ValidationMessage("SubdisciplinaNombre")%>
    </p>
<% } else { %>
    <p>
        <label>Subdisciplina</label>
        <span class="valor"><%= Html.Encode(Model.SubdisciplinaNombre)%>&nbsp;</span>
    </p>
<% } %>