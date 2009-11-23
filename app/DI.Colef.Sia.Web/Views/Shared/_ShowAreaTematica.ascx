<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>L&iacute;nea tem&aacute;tica</label>
    <span class="valor"><%= Html.Encode(Model.AreaTematicaLineaTematicaNombre) %>&nbsp;</span>
</p>
<p>
    <label>&Aacute;rea tem&aacute;tica</label>
    <span class="valor"><%= Html.Encode(Model.AreaTematicaNombre) %>&nbsp;</span>
</p>
<h4>&Aacute;rea del conocimiento</h4>
<p>
    <label>&Aacute;rea</label>
    <span class="valor"><%= Html.Encode(Model.AreaTematicaSubdisciplinaDisciplinaAreaNombre)%>&nbsp;</span>
</p>
<p>
    <label>Disciplina</label>
    <span class="valor"><%= Html.Encode(Model.AreaTematicaSubdisciplinaDisciplinaNombre)%>&nbsp;</span>
</p>
<p>
    <label>Subdisciplina</label>
    <span class="valor"><%= Html.Encode(Model.AreaTematicaSubdisciplinaNombre)%>&nbsp;</span>
</p>