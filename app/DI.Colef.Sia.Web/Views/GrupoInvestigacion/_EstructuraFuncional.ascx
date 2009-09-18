<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<GrupoInvestigacionForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Sector</label>
    <%=Html.DropDownList("Sector", Model.Sectores.CreateSelectList<SectorForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "cascade", rel = Url.Action("ChangeSector") })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Sector") %>
</p>
<p>
    <label>Organizaci&oacute;n</label>
    <%=Html.DropDownList("Organizacion", Model.Organizaciones.CreateSelectList<OrganizacionForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "cascade", rel = Url.Action("ChangeOrganizacion") })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Organizacion") %>
</p>
<p>
    <label>Nivel 2</label>
    <%=Html.DropDownList("Nivel2", Model.Niveles2.CreateSelectList<NivelForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "cascade", rel = Url.Action("ChangeNivel") })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Nivel2") %>
</p>
<p>
    <label>Nivel 3</label>
    <%=Html.DropDownList("Nivel3", Model.Niveles3.CreateSelectList<NivelForm>("Id", "Nombre"),
        "Seleccione ...")%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Nivel3") %>
</p>
<p>
    <label>Nivel 4</label>
    <%=Html.DropDownList("Nivel4", Model.Niveles4.CreateSelectList<NivelForm>("Id", "Nombre"),
        "Seleccione ...")%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Nivel4") %>
</p>
<p>
    <label>Nivel 5</label>
    <%=Html.DropDownList("Nivel5", Model.Niveles5.CreateSelectList<NivelForm>("Id", "Nombre"),
        "Seleccione ...")%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Nivel5") %>
</p>
<p>
    <label>Nivel 6</label>
    <%=Html.DropDownList("Nivel6", Model.Niveles6.CreateSelectList<NivelForm>("Id", "Nombre"),
        "Seleccione ...")%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Nivel6") %>
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