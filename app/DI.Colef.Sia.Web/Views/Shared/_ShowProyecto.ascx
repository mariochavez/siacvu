<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<% if(!Model.IsShowForm){ %>
    <p>
        <label>Nombre del proyecto de investigaci&oacute;n</label>
        <%=Html.TextBox("ProyectoNombre", Model.ProyectoNombre,
            new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "Proyecto"), maxlength = 100 })%>
        <%=Html.Hidden("ProyectoId", Model.ProyectoId, new { rel = "#ProyectoNombre", url = Url.Action("ChangeProyecto") })%>
        <%=Html.ValidationMessage("ProyectoNombre")%>
    </p>
<% } else { %>
    <p>
        <label>Nombre del proyecto de investigaci&oacute;n</label>
        <span class="valor"><%= Html.Encode(Model.ProyectoNombre)%>&nbsp;</span>
    </p>
<% } %>
<p>
    <label>L&iacute;nea tem&aacute;tica</label>
    <span id="span_lineaproyecto" class="valor"><%= Html.Encode(Model.ProyectoAreaTematicaLineaTematicaNombre)%>&nbsp;</span>
</p>
<p>
    <label>&Aacute;rea tem&aacute;tica</label>
    <span id="span_areatematicaproyecto" class="valor"><%= Html.Encode(Model.ProyectoAreaTematicaNombre)%>&nbsp;</span>
</p>
<h4>&Aacute;rea del conocimiento</h4>
<p>
    <label>&Aacute;rea</label>
    <span id="span_areaproyecto" class="valor"><%= Html.Encode(Model.ProyectoAreaTematicaSubdisciplinaDisciplinaAreaNombre)%>&nbsp;</span>
</p>
<p>
    <label>Disciplina</label>
    <span id="span_disciplinaproyecto" class="valor"><%= Html.Encode(Model.ProyectoAreaTematicaSubdisciplinaDisciplinaNombre)%>&nbsp;</span>
</p>
<p>
    <label>Subdisciplina</label>
    <span id="span_subdisciplinaproyecto" class="valor"><%= Html.Encode(Model.ProyectoAreaTematicaSubdisciplinaNombre)%>&nbsp;</span>
</p>