<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<TesisDirigidaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>T&iacute;tulo de la tesis</label>
    <span class="valor"><%= Html.Encode(Model.Titulo) %>&nbsp;</span>
</p>
<p>
    <label>Vinculaci&oacute;n con la APyD</label>
    <span class="valor"><%= Html.Encode(Model.VinculacionAPyDNombre) %>&nbsp;</span>
</p>
<p>
    <label>Forma de participaci&oacute;n</label>
    <span class="valor"><%= Html.Encode(Model.FormaParticipacionNombre) %>&nbsp;</span>
</p>
<p>
    <label>Nombre del alumno(autor)</label>
    <span class="valor"><%= Html.Encode(Model.NombreAlumno) %>&nbsp;</span>
</p>
<p>
    <label>Grado acad&eacute;mico obtenido/por obtener</label>
    <span class="valor"><%= Html.Encode(Model.GradoAcademicoNombre) %>&nbsp;</span>
</p>
<p>
    <label>Instituci&oacute;n</label>
    <span class="valor"><%= Html.Encode(Model.InstitucionNombre) %>&nbsp;</span>
</p>
<p>
    <label>Pa&iacute;s</label>
    <span class="valor"><%= Html.Encode(Model.InstitucionPaisNombre) %>&nbsp;</span>
</p>