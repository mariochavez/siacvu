<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<LibroForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label></label>
    <%= Html.CheckBox("TieneProyecto", Model.TieneProyecto) %> ¿Existe proyecto de investigaci&oacute;n de referencia?
    <br /><label></label><span>(Marque en caso positivo)</span>
</p>
<div id="tieneproyecto_field">
    <% Html.RenderPartial("_ShowProyecto", new ShowFieldsForm { ProyectoId = Model.ProyectoId, ProyectoNombre = Model.ProyectoNombre, IsShowForm = false}); %>
</div>

<% Html.RenderPartial("_LineaAreaTematica", Model); %>
<% Html.RenderPartial("_ShowSubdisciplina", new ShowFieldsForm { Areas = Model.Areas, Disciplinas = Model.Disciplinas, Subdisciplinas = Model.Subdisciplinas, IsShowForm = false }); %>
<% Html.RenderPartial("_ShowPalabrasClave", new ShowFieldsForm { PalabraClave1 = Model.PalabraClave1, PalabraClave2 = Model.PalabraClave2, PalabraClave3 = Model.PalabraClave3, IsShowForm = false }); %>