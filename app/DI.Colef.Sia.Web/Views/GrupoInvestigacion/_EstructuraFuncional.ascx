<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<GrupoInvestigacionForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Sector</label>
    <%=Html.DropDownList("Sector", Model.Sectores.CreateSelectList<SectorForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Sector") %>
</p>
<p>
    <label>Organizacion</label>
    <%=Html.DropDownList("Organizacion", Model.Organizaciones.CreateSelectList<OrganizacionForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Organizacion") %>
</p>
<p>
    <label>Nivel2</label>
    <%=Html.DropDownList("Nivel2", Model.Niveles2.CreateSelectList<NivelForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Nivel2") %>
</p>
<p>
    <label>Nivel3</label>
    <%=Html.DropDownList("Nivel3", Model.Niveles3.CreateSelectList<NivelForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Nivel3") %>
</p>
<p>
    <label>Nivel4</label>
    <%=Html.DropDownList("Nivel4", Model.Niveles4.CreateSelectList<NivelForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Nivel4") %>
</p>
<p>
    <label>Nivel5</label>
    <%=Html.DropDownList("Nivel5", Model.Niveles5.CreateSelectList<NivelForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Nivel5") %>
</p>
<p>
    <label>Nivel6</label>
    <%=Html.DropDownList("Nivel6", Model.Niveles6.CreateSelectList<NivelForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Nivel6") %>
</p>
<p>
    <label>Lider</label>
    <%= Html.CheckBox("Lider", Model.Lider) %>
    <%=Html.ValidationMessage("Lider")%>
</p>
<p>
    <label>Nombre</label>
    <%=Html.TextBox("Nombre", Model.Nombre, new { @class = "input250-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("Nombre")%>
</p>
<p>
    <label>Miembros</label>
    <%=Html.TextBox("Miembros", Model.Miembros, new { @class = "input250-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("Miembros")%>
</p>
<p>
    <label>Impacto</label>
    <%=Html.TextBox("Impacto", Model.Impacto, new { @class = "input250-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("Impacto")%>
</p>
<p>
    <label>Vinculacion Sector Productivo</label>
    <%=Html.TextBox("VinculacionSectorProductivo", Model.VinculacionSectorProductivo, new { @class = "input250-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("VinculacionSectorProductivo")%>
</p>
<p>
    <label>Vinculacion Sector Social</label>
    <%=Html.TextBox("VinculacionSectorSocial", Model.VinculacionSectorSocial, new { @class = "input250-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("VinculacionSectorSocial")%>
</p>
<p>
    <label>Colaboracion</label>
    <%=Html.TextBox("Colaboracion", Model.Colaboracion, new { @class = "input250-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("Colaboracion")%>
</p>
<p>
    <label>Administracion</label>
    <%=Html.TextBox("Administracion", Model.Administracion, new { @class = "input250-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("Administracion")%>
</p>
<p>
    <label>Programa Registrado</label>
    <%=Html.TextBox("ProgramaRegistrado", Model.ProgramaRegistrado, new { @class = "input250-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("ProgramaRegistrado")%>
</p>