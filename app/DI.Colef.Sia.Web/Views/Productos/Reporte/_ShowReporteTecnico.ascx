<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ReporteForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<% Html.RenderPartial("_ShowInstitucion", new InstitucionForm { Instituciones = Model.InstitucionReportes, ModelId = Model.Id }); %>

<p>
    <label></label>
    ¿Existe proyecto de investigaci&oacute;n de referencia?
    <span class="valor"><%= HumanizeHelper.Boolean(Model.TieneProyecto) %>&nbsp;</span>
</p>

<% if (Model.TieneProyecto) { %>
    <% Html.RenderPartial("_ShowProyecto", Model.ShowFields); %>
<% } %>

<p>
    <label>Descripci&oacute;n del informe</label>
    <span class="valor"><%= Html.Encode(Model.Descripcion)%>&nbsp;</span>
</p>
<p>
    <label>Objetivo del informe</label>
    <span class="valor"><%= Html.Encode(Model.Objetivo)%>&nbsp;</span>
</p>
<p>
    <label>No. de p&aacute;ginas</label>
    <span class="valor"><%= Html.Encode(Model.NoPaginas)%>&nbsp;</span>
</p>