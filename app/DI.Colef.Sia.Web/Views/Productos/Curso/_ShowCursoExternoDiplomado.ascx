<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CursoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Fecha inicial</label>
    <span class="valor"><%= Html.Encode(Model.FechaInicial) %>&nbsp;</span>
</p>
<p>
    <label>Fecha final</label>
    <span class="valor"><%= Html.Encode(Model.FechaFinal) %>&nbsp;</span>
</p>
<p>
    <label>N&uacute;mero de horas</label>
    <span class="valor"><%= Html.Encode(Model.NumeroHoras) %>&nbsp;</span>
</p>