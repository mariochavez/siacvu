<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<GrupoInvestigacionForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Nivel 2</label>
    <%=Html.DropDownList("Nivel2Id", Model.Niveles2.CreateSelectList<NivelForm>("Id", "Nombre"),
        "Seleccione ...")%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Nivel2Id") %>
</p>
<p>
    <label>L&iacute;der</label>
    <%= Html.CheckBox("Lider", Model.Lider) %>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Lider")%>
</p>
<p>
    <label>Nombre</label>
    <%=Html.TextBox("Nombre", Model.Nombre, new { @class = "input250", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Nombre")%>
</p>
<p>
    <label>Miembros</label>
    <%=Html.TextBox("Miembros", Model.Miembros, new { @class = "input250", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Miembros")%>
</p>
<p>
    <label>Impacto</label>
    <%=Html.TextBox("Impacto", Model.Impacto, new { @class = "input250", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Impacto")%>
</p>
<p>
    <label>Vinculaci&oacute;n del sector productivo</label>
    <%=Html.TextBox("VinculacionSectorProductivo", Model.VinculacionSectorProductivo, new { @class = "input250", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("VinculacionSectorProductivo")%>
</p>
<p>
    <label>Vinculaci&oacute;n del sector social</label>
    <%=Html.TextBox("VinculacionSectorSocial", Model.VinculacionSectorSocial, new { @class = "input250", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("VinculacionSectorSocial")%>
</p>
<p>
    <label>Colaboraci&oacute;n</label>
    <%=Html.TextBox("Colaboracion", Model.Colaboracion, new { @class = "input250", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Colaboracion")%>
</p>
<p>
    <label>Administraci&oacute;n</label>
    <%=Html.TextBox("Administracion", Model.Administracion, new { @class = "input250", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Administracion")%>
</p>
<p>
    <label>Programa registrado</label>
    <%=Html.TextBox("ProgramaRegistrado", Model.ProgramaRegistrado, new { @class = "input250", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("ProgramaRegistrado")%>
</p>