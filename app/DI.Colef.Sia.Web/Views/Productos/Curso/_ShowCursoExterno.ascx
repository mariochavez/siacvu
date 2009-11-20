<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CursoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Nivel de estudio</label>
    <span class="valor"><%= Html.Encode(Model.NivelEstudioNombre) %>&nbsp;</span>
</p>
<p>
    <label>Programa de estudio</label>
    <span class="valor"><%= Html.Encode(Model.ProgramaEstudioNombre) %>&nbsp;</span>
</p>
<p>
    <label>Nombre del curso</label>
    <span class="valor"><%= Html.Encode(Model.Nombre) %>&nbsp;</span>
</p>
<p>
    <label>Instituci&oacute;n</label>
    <span class="valor"><%= Html.Encode(Model.InstitucionNombre) %>&nbsp;</span>
</p>