<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Instituci&oacute;n participante</label>
	<%=Html.TextBox("InstitucionEvento.Nombre", "",
        new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "Institucion"), maxlength = 100 })%>
    <%=Html.Hidden("InstitucionEvento.InstitucionId", 0, new { rel = "#InstitucionEvento_Nombre" })%>
</p>
<p>
    <label>Objetivo del evento</label>
    <%=Html.TextBox("InstitucionEvento.ObjetivoEvento", "", new { @class = "input420", maxlength = 100 })%>
</p>