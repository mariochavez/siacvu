<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<RevistaPublicacionForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Titulo</label>
    <%=Html.TextBox("Titulo", Model.Titulo, new { @class = "input250-requerido", maxlength = 40 })%>
    <span>(Debe de ser un nombre unico)</span>
    <%=Html.ValidationMessage("Titulo")%>
</p>
<p>
    <label>Periodicidad</label>
    <%=Html.TextBox("Periodicidad", Model.Periodicidad, new { @class = "input250-requerido", maxlength = 40 })%>
    <%=Html.ValidationMessage("Periodicidad")%>
</p>
<p>
    <label>Issn</label>
    <%=Html.TextBox("Issn", Model.Issn, new { @class = "input250-requerido", maxlength = 40 })%>
    <%=Html.ValidationMessage("Issn")%>
</p>
<p>
    <label>Detalle</label>
    <%=Html.TextBox("Detalle", Model.Detalle, new { @class = "input250-requerido", maxlength = 40 })%>
    <%=Html.ValidationMessage("Detalle")%>
</p>
<p>
    <label>Tipo</label>
    <%=Html.TextBox("Tipo", Model.Tipo, new { @class = "input250-requerido", maxlength = 40 })%>
    <%=Html.ValidationMessage("Tipo")%>
</p>
<p>
    <label>Estado</label>
    <%=Html.TextBox("Estado", Model.Estado, new { @class = "input250-requerido", maxlength = 40 })%>
    <%=Html.ValidationMessage("Estado")%>
</p>
<p>
    <label>Instituci&oacute;n</label>
    <%=Html.TextBox("InstitucionNombre", Model.InstitucionNombre,
        new { @class = "autocomplete input250-requerido", rel = Url.Action("Search", "Institucion"), maxlength = 100 })%>
    <%=Html.Hidden("InstitucionId", Model.InstitucionId, new { rel = "#InstitucionNombre" })%>
</p>
