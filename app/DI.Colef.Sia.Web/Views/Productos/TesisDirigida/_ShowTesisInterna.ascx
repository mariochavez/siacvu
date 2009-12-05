<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<TesisDirigidaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
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
<p>
    <label>Instituci&oacute;n</label>
    <span id="span_instituciontesis" class="valor"><%= Html.Encode(Model.TesisPosgrado.InstitucionNombre)%>&nbsp;</span>
</p>
<p>
    <label>Pa&iacute;s</label>
    <span id="span_paistesis" class="valor"><%= Html.Encode(Model.TesisPosgrado.InstitucionPaisNombre)%>&nbsp;</span>
</p>

<h4>Estructura funcional</h4>
<p>
    <label>Sector</label>
    <span id="span_sector" class="valor"><%= Html.Encode(Model.TesisPosgrado.SectorNombre)%>&nbsp;</span>
</p>
<p>
    <label>Organizaci&oacute;n</label>
    <span id="span_organizacion" class="valor"><%= Html.Encode(Model.TesisPosgrado.OrganizacionNombre)%>&nbsp;</span>
</p>
<p>
    <label>2do. Nivel</label>
    <span id="span_2donivel" class="valor"><%= Html.Encode(Model.TesisPosgrado.Nivel2Nombre)%>&nbsp;</span>
</p>