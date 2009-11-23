<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<h4>Actividad econ&oacute;mica</h4>
<p>
    <label>Sector</label>
    <span class="valor"><%= Html.Encode(Model.ClaseRamaSectorEconomicoNombre)%>&nbsp;</span>
</p>
<p>
    <label>Rama</label>
    <span class="valor"><%= Html.Encode(Model.ClaseRamaNombre)%>&nbsp;</span>
</p>
<p>
    <label>Clase</label>
    <span class="valor"><%= Html.Encode(Model.ClaseNombre)%>&nbsp;</span>
</p>