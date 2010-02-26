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
    <%if(!Model.RevistaPublicacionExists) { %>
        <span class="field-alert">Esta instituci&oacute;n no esta registrada en el cat&aacute;logo</span>
    <% } %>
</p>
<%if(!Model.RevistaPublicacionExists) { %>
    <% if(!String.IsNullOrEmpty(Model.RevistaPublicacionInstitucionNombre)) { %>
    <p>
        <label>Instituci&oacute;n</label>
        <span id="span_institucionrevista" class="valor"><%=Html.Encode(Model.RevistaPublicacionInstitucionNombre)%>&nbsp;</span>
    </p>
    <% } %>
    <% if(!String.IsNullOrEmpty(Model.RevistaPublicacionIndice1Nombre)) { %>
    <p>
        <label>Clasificaci&oacute;n 1</label>
        <span id="span_indice1revista" class="valor"><%=Html.Encode(Model.RevistaPublicacionIndice1Nombre)%>&nbsp;</span>
    </p>
    <% } %>
    <% if(!String.IsNullOrEmpty(Model.RevistaPublicacionIndice2Nombre)) { %>
    <p>
        <label>Clasificaci&oacute;n 2</label>
        <span id="span_indice2revista" class="valor"><%=Html.Encode(Model.RevistaPublicacionIndice2Nombre)%>&nbsp;</span>
    </p>
    <% } %>
    <% if(!String.IsNullOrEmpty(Model.RevistaPublicacionIndice3Nombre)) { %>
    <p>
        <label>Clasificaci&oacute;n 3</label>
        <span id="span_indice3revista" class="valor"><%=Html.Encode(Model.RevistaPublicacionIndice3Nombre)%>&nbsp;</span>
    </p>
    <% } %>
<% } %>