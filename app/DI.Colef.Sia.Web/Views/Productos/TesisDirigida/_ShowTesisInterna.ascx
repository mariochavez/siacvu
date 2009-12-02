<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<TesisDirigidaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Nombre del alumno(autor)</label>
    <span id="span_nombrealumno" class="valor"><%= Html.Encode(Model.TesisPosgrado.NombreAlumno) %>&nbsp;</span>
</p>
<p>
    <label>T&iacute;tulo de la tesis</label>
    <span id="span_titulotesis" class="valor"><%= Html.Encode(Model.TesisPosgrado.Titulo) %>&nbsp;</span>
</p>
<p>
    <label>Vinculaci&oacute;n con la APyD</label>
    <span id="span_vinculacionapyd" class="valor"><%= Html.Encode(Model.TesisPosgrado.VinculacionAPyDNombre) %>&nbsp;</span>
</p>
<p>
    <label>Forma de participaci&oacute;n</label>
    <span id="span_formaparticipacion" class="valor"><%= HumanizeHelper.FormaParticipacion(Model.TesisPosgrado.FormaParticipacion) %>&nbsp;</span>
</p>
<p>
    <label>Programa de estudio</label>
    <span id="span_programaestudio" class="valor"><%= Html.Encode(Model.TesisPosgrado.ProgramaEstudioNombre) %>&nbsp;</span>
</p>
<p>
    <label>Grado acad&eacute;mico obtenido/por obtener</label>
    <span id="span_gradoacademico" class="valor"><%= Html.Encode(Model.TesisPosgrado.GradoAcademicoNombre) %>&nbsp;</span>
</p>
<p>
    <label>Fecha de obtenci&oacute;n del grado</label>
    <span id="span_fechagrado" class="valor"><%= Html.Encode(Model.TesisPosgrado.FechaGrado) %>&nbsp;</span>
</p>

<% Html.RenderPartial("_ShowInstitucionShort", Model.ShowFields); %>
<% Html.RenderPartial("_Show2doNivel", Model.ShowFields); %>
<% Html.RenderPartial("_ShowSubdisciplina", Model.ShowFields); %>