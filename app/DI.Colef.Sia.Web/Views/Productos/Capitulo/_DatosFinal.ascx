<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label></label>
    <%= Html.CheckBox("TieneProyecto", Model.TieneProyecto) %> ¿Existe proyecto de investigaci&oacute;n de referencia?
</p>
<div id="tieneproyecto_field">
    <% Html.RenderPartial("_ShowProyecto", new ShowFieldsForm { ProyectoId = Model.ProyectoId, ProyectoNombre = Model.ProyectoNombre, IsShowForm = false}); %>
</div>

<% Html.RenderPartial("_ShowAreaTematica", new ShowFieldsForm { AreaTematicaId = Model.AreaTematicaId, AreaTematicaNombre = Model.AreaTematicaNombre, IsShowForm = false}); %>  
<% Html.RenderPartial("_ShowSubdisciplina", new ShowFieldsForm { Areas = Model.Areas, Disciplinas = Model.Disciplinas, Subdisciplinas = Model.Subdisciplinas, IsShowForm = false }); %>