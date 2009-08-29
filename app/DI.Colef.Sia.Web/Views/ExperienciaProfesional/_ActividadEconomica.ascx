<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ExperienciaProfesionalForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
	<label>Sector</label>
	<%=Html.DropDownList("Sector", Model.Sectores.CreateSelectList<SectorForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<%=Html.ValidationMessage("Sector") %>
</p>
<p>
    <label>Rama</label>
    <%=Html.DropDownList("Rama", Model.Ramas.CreateSelectList<RamaForm>("Id", "Nombre"),
	            "Seleccione ...")%>
    <%=Html.ValidationMessage("Rama") %>
</p>
<p>
    <label>Clase</label>
    <%=Html.DropDownList("Clase", Model.Clases.CreateSelectList<ClaseForm>("Id", "Nombre"),
	            "Seleccione ...")%>
    <%=Html.ValidationMessage("Clase") %>
</p>
<p>
    <label>L&iacute;neas de investigaci&oacute;n</label>
    <%=Html.TextArea("LineasInvestigacion", Model.LineasInvestigacion, 3, 35, new { @class = "input250", maxlength = 100 })%>
    <%=Html.ValidationMessage("LineasInvestigacion")%>
    <span>(L&iacute;neas de Investigaci&oacute;n)</span>
</p>
<p>
    <label>Principales logros</label>
    <%=Html.TextBox("PrincipalesLogros", Model.PrincipalesLogros, new { @class = "input250", maxlength = 100, size = 14 })%>
    <%=Html.ValidationMessage("PrincipalesLogros")%>
</p>