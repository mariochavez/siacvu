<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<GrupoInvestigacionForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Impacto / Productividad</label>
    <%=Html.TextArea("Impacto", Model.Impacto, 4, 35, new { @class = "input420", maxlength = 300 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Impacto")%>
</p>
<p>
    <label>Vinculaci&oacute;n con el Sector Productivo</label>
    <%=Html.TextArea("VinculacionSectorProductivo", Model.VinculacionSectorProductivo, 4, 35, new { @class = "input420", maxlength = 300 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("VinculacionSectorProductivo")%>
</p>
<p>
    <label>Vinculaci&oacute;n con el Sector Social</label>
    <%=Html.TextArea("VinculacionSectorSocial", Model.VinculacionSectorSocial, 4, 35, new { @class = "input420", maxlength = 300 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("VinculacionSectorSocial")%>
</p>
<p>
    <label>Colaboraci&oacute;n</label>
    <%=Html.TextArea("Colaboracion", Model.Colaboracion, 4, 35, new { @class = "input420", maxlength = 300 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Colaboracion")%>
</p>
<p>
    <label>Administraci&oacute;n</label>
    <%=Html.TextArea("Administracion", Model.Administracion, 4, 35, new { @class = "input420", maxlength = 300 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Administracion")%>
</p>
<p>
    <label>Programa registrado</label>
    <%=Html.TextBox("ProgramaRegistrado", Model.ProgramaRegistrado, new { @class = "input420", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("ProgramaRegistrado")%>
</p>