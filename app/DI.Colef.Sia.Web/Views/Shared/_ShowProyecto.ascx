<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>L&iacute;nea tem&aacute;tica</label>
    <strong><%= Html.Encode(Model.ProyectoAreaTematicaLineaTematicaNombre)%>&nbsp;</strong>
</p>
<p>
    <label>&Aacute;rea tem&aacute;tica</label>
    <strong><%= Html.Encode(Model.ProyectoAreaTematicaNombre)%>&nbsp;</strong>
</p>
<p>
    <label>&Aacute;rea</label>
    <strong><%= Html.Encode(Model.ProyectoAreaTematicaSubdisciplinaDisciplinaAreaNombre)%>&nbsp;</strong>
</p>
<p>
    <label>Disciplina</label>
    <strong><%= Html.Encode(Model.ProyectoAreaTematicaSubdisciplinaDisciplinaNombre)%>&nbsp;</strong>
</p>
<p>
    <label>Subdisciplina</label>
    <strong><%= Html.Encode(Model.ProyectoAreaTematicaSubdisciplinaNombre)%>&nbsp;</strong>
</p>