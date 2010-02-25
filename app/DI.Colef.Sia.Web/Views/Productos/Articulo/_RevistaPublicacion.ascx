<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<BaseForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Catalogos" %>
<p>
    <label>T&iacute;tulo de la revista</label>
    <%=Html.TextBox("RevistaPublicacionTitulo", Model.RevistaPublicacionTitulo,
                new { @class = "autocomplete buscar-requerido", url = Html.BuildUrlFromExpressionForAreas<RevistaPublicacionController>(x => x.Search("")), maxlength = 100 })%>
    <%=Html.Hidden("RevistaPublicacionId", Model.RevistaPublicacionId, new { rel = "#RevistaPublicacionTitulo", url = Url.Action("ChangeRevista") })%>
    <span class="cvu"></span>
</p>