<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
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