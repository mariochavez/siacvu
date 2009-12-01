<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<TesisDirigidaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Nombre del alumno(autor)</label>
    <span class="valor"><%= Html.Encode(Model.TesisPosgrado.NombreAlumno) %>&nbsp;</span>
</p>
<p>
    <label>T&iacute;tulo de la tesis</label>
    <span class="valor"><%= Html.Encode(Model.TesisPosgrado.Titulo) %>&nbsp;</span>
</p>
<p>
    <label>Vinculaci&oacute;n con la APyD</label>
    <span class="valor"><%= Html.Encode(Model.TesisPosgrado.VinculacionAPyDNombre) %>&nbsp;</span>
</p>
<p>
    <label>Forma de participaci&oacute;n</label>
    <span class="valor"><%= HumanizeHelper.FormaParticipacion(Model.TesisPosgrado.FormaParticipacion) %>&nbsp;</span>
</p>
<p>
    <label>Programa de estudio</label>
    <span class="valor"><%= Html.Encode(Model.TesisPosgrado.ProgramaEstudioNombre) %>&nbsp;</span>
</p>
<p>
    <label>Grado acad&eacute;mico obtenido/por obtener</label>
    <span class="valor"><%= Html.Encode(Model.TesisPosgrado.GradoAcademicoNombre) %>&nbsp;</span>
</p>
<p>
    <label>Fecha de obtenci&oacute;n del grado</label>
    <span class="valor"><%= Html.Encode(Model.TesisPosgrado.FechaGrado) %>&nbsp;</span>
</p>

<% Html.RenderPartial("_ShowInstitucionShort", Model.ShowFields); %>

<% Html.RenderPartial("_Show2doNivel", Model.ShowFields); %>

<% Html.RenderPartial("_ShowSubdisciplina", Model.ShowFields); %>