<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ExperienciaProfesionalForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
	<label>Sector</label>
	<%=Html.DropDownList("Sector", Model.Sectores.CreateSelectList<SectorForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "cascade", rel = Url.Action("ChangeSector1") })%>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("Sector") %>
</p>
<p>
    <label>Rama</label>
    <%=Html.DropDownList("Rama", Model.Ramas.CreateSelectList<RamaForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "cascade", rel = Url.Action("ChangeRama") })%>
	<span class="cvu"></span>
    <%=Html.ValidationMessage("Rama") %>
</p>
<p>
    <label>Clase</label>
    <%=Html.DropDownList("Clase", Model.Clases.CreateSelectList<ClaseForm>("Id", "Nombre"),
	            "Seleccione ...")%>
	<span class="cvu"></span>
    <%=Html.ValidationMessage("Clase") %>
</p>
<p>
    <label>L&iacute;nea de investigaci&oacute;n 1</label>
    <%=Html.TextArea("LineaInvestigacion1", Model.LineaInvestigacion1, 3, 35, new { @class = "input420", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("LineaInvestigacion1")%>
</p>
<p>
    <label>L&iacute;nea de investigaci&oacute;n 2</label>
    <%=Html.TextArea("LineaInvestigacion2", Model.LineaInvestigacion2, 3, 35, new { @class = "input420", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("LineaInvestigacion2")%>
</p>
<p>
    <label>L&iacute;nea de investigaci&oacute;n 3</label>
    <%=Html.TextArea("LineaInvestigacion3", Model.LineaInvestigacion3, 3, 35, new { @class = "input420", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("LineaInvestigacion3")%>
</p>
<p>
    <label>Principales logros</label>
    <%=Html.TextArea("PrincipalesLogros", Model.PrincipalesLogros, 3, 35, new { @class = "input420", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("PrincipalesLogros")%>
</p>