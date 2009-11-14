<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Sector</label>
    <span class="valor"><%= Html.Encode(Model.Nivel2OrganizacionSectorNombre)%>&nbsp;</span>
</p>
<p>
    <label>Organizaci&oacute;n</label>
    <span class="valor"><%= Html.Encode(Model.Nivel2OrganizacionNombre)%>&nbsp;</span>
</p>
<p>
    <label>2do. Nivel</label>
    <span class="valor"><%= Html.Encode(Model.Nivel2Nombre)%>&nbsp;</span>
</p>