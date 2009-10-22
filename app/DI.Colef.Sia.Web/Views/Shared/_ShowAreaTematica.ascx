<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>L&iacute;nea tem&aacute;tica</label>
    <strong><%= Html.Encode(Model.AreaTematicaLineaTematicaNombre) %>&nbsp;</strong>
</p>
<p>
    <label>&Aacute;rea tem&aacute;tica</label>
    <strong><%= Html.Encode(Model.AreaTematicaNombre) %>&nbsp;</strong>
</p>
<p>
    <label>&Aacute;rea</label>
    <strong><%= Html.Encode(Model.AreaTematicaSubdisciplinaDisciplinaAreaNombre)%>&nbsp;</strong>
</p>
<p>
    <label>Disciplina</label>
    <strong><%= Html.Encode(Model.AreaTematicaSubdisciplinaDisciplinaNombre)%>&nbsp;</strong>
</p>
<p>
    <label>Subdisciplina</label>
    <strong><%= Html.Encode(Model.AreaTematicaSubdisciplinaNombre)%>&nbsp;</strong>
</p>