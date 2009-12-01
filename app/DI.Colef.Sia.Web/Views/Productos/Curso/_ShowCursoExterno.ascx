<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CursoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Nombre del curso</label>
    <span class="valor"><%= Html.Encode(Model.Nombre) %>&nbsp;</span>
</p>
<p>
    <label>Programa de estudios</label>
    <span class="valor"><%= Html.Encode(Model.ProgramaEstudioNombre) %>&nbsp;</span>
</p>
<p>
    <label>Nivel de estudios</label>
    <span class="valor"><%= Html.Encode(Model.NivelEstudioNombre) %>&nbsp;</span>
</p>

<% Html.RenderPartial("_ShowInstitucionShort", Model.ShowFields); %>

<p>
    <label>Fecha de inicio</label>
    <span class="valor"><%= Html.Encode(Model.FechaInicial) %>&nbsp;</span>
</p>
<p>
    <label>Fecha de fin</label>
    <span class="valor"><%= Html.Encode(Model.FechaFinal) %>&nbsp;</span>
</p>
<p>
    <label>N&uacute;mero de horas</label>
    <span class="valor"><%= Html.Encode(Model.NumeroHoras) %>&nbsp;</span>
</p>

<% Html.RenderPartial("_Show2doNivel", Model.ShowFields); %>

<% Html.RenderPartial("_ShowSubdisciplina", Model.ShowFields); %>