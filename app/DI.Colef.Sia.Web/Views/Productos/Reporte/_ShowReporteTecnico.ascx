<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ReporteForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Descripci&oacute;n del informe</label>
    <strong><%= Html.Encode(Model.Descripcion)%>&nbsp;</strong>
</p>
<p>
    <label>Objetivo del informe</label>
    <strong><%= Html.Encode(Model.Objetivo)%>&nbsp;</strong>
</p>
<p>
    <label>No. de p&aacute;ginas</label>
    <strong><%= Html.Encode(Model.NoPaginas)%>&nbsp;</strong>
</p>
<p>
    <label>Fecha de edici&oacute;n</label>
    <strong><%= Html.Encode(Model.FechaEdicion)%>&nbsp;</strong><span>Formato (dd/mm/yyyy)</span>
</p>