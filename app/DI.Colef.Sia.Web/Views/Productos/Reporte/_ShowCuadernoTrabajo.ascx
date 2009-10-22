<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ReporteForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Descripci&oacute;n del cuaderno</label>
    <strong><%= Html.Encode(Model.Descripcion)%>&nbsp;</strong>
</p>
<p>
    <label>Objetivo del cuaderno</label>
    <strong><%= Html.Encode(Model.Objetivo)%>&nbsp;</strong>
</p>