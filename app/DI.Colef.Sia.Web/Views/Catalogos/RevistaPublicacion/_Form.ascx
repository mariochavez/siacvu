<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<RevistaPublicacionForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<h4>Datos generales de la revista</h4>
<p>
    <label>Nombre de la revista</label>
    <%=Html.TextBox("Titulo", Model.Titulo, new { @class = "input250-requerido", maxlength = 40 })%>
    <span>(Debe de ser un nombre &uacute;nico)</span>
    <%=Html.ValidationMessage("Titulo")%>
</p>
<p>
    <label>Instituci&oacute;n</label>
    <%=Html.TextBox("InstitucionNombre", Model.InstitucionNombre,
        new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "Institucion"), maxlength = 100 })%>
    <%=Html.Hidden("InstitucionId", Model.InstitucionId, new { rel = "#InstitucionNombre" })%>
    <%=Html.ValidationMessage("InstitucionNombre")%>
</p>
<p>
    <label>Departamento acad&eacute;mico</label>
    <%=Html.TextBox("DepartamentoAcademico", Model.DepartamentoAcademico, new { @class = "input420-requerido", maxlength = 40 })%>
    <%=Html.ValidationMessage("DepartamentoAcademico")%>
</p>
<p>
    <label>ISSN</label>
    <%=Html.TextBox("Issn", Model.Issn, new { @class = "input420-requerido", maxlength = 40 })%>
    <%=Html.ValidationMessage("Issn")%>
</p>
<p>
    <label>Contacto de la revista</label>
    <%=Html.TextBox("Contacto", Model.Contacto, new { @class = "input420-requerido", maxlength = 40 })%>
    <%=Html.ValidationMessage("Contacto")%>
</p>
<p>
    <label>E-mail</label>
    <%=Html.TextBox("Email", Model.Email, new { @class = "input420-requerido", maxlength = 40 })%>
    <%=Html.ValidationMessage("Email")%>
</p>
<p>
    <label>P&aacute;gina web</label>
    <%=Html.TextBox("PaginaWeb", Model.PaginaWeb, new { @class = "input420-requerido", maxlength = 40 })%>
    <%=Html.ValidationMessage("PaginaWeb")%>
</p>
<p>
    <label>Tel&eacute;fono y/o fax</label>
    <%=Html.TextBox("Telefono", Model.Telefono, new { @class = "input100-requerido", maxlength = 10 })%>
    <%=Html.ValidationMessage("Telefono")%>
</p>
<h4>Caracter&iacute;sticas de la revista</h4>
<p>
    <label>Tipo de arbitraje</label>
    <%=Html.DropDownList("TipoRevista", Model.TipoRevistas.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
		"Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("TipoRevista")%>
</p>
<p>
    <label>Clasificaci&oacute;n en el SIEVA</label>
    <%=Html.DropDownList("ClasificacionSieva", Model.ClasificacionesSieva.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
		"Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("ClasificacionSieva")%>
</p>
<p>
    <label>Descripci&oacute;n de la revista</label>
    <%=Html.TextBox("DescripcionRevista", Model.DescripcionRevista, new { @class = "input420-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("DescripcionRevista")%>
</p>
<p>
    <label>Factor de impacto</label>
    <%=Html.TextBox("FactorImpacto", Model.FactorImpacto, new { @class = "input420-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("FactorImpacto")%>
</p>
<p>
    <label>Formato de la revista</label>
    <%=Html.DropDownList("FormatoRevista", Model.FormatoRevistas.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
		"Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("FormatoRevista")%>
</p>
<p>
    <label>Periodicidad</label>
    <%=Html.DropDownList("Periodicidad", Model.Periodicidades.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
		"Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Periodicidad")%>
</p>
<p>
    <label>&Aacute;rea de investigaci&oacute;n</label>
    <%=Html.DropDownList("AreaInvestigacion", Model.AreasInvestigacion.CreateSelectList<AreaInvestigacionForm>("Id", "Nombre"),
		"Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("AreaInvestigacion") %>
</p>
<p>
    <label>Pa&iacute;s</label>
    <%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
		"Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Pais") %>
</p>
<h4>&Iacute;ndices a los que pertenece la revista</h4>
<p>
    <label>&Iacute;ndice 1</label>
    <%=Html.DropDownList("Indice1", Model.Indices1.CreateSelectList<IndiceForm>("Id", "Nombre"),
		"Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Indice1")%>
</p>
<p>
    <label>&Iacute;ndice 2</label>
    <%=Html.DropDownList("Indice2", Model.Indices2.CreateSelectList<IndiceForm>("Id", "Nombre"),
		"Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Indice2")%>
</p>
<p>
    <label>&Iacute;ndice 3</label>
    <%=Html.DropDownList("Indice3", Model.Indices3.CreateSelectList<IndiceForm>("Id", "Nombre"),
		"Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Indice3")%>
</p>
<p>
    <label>&Iacute;ndice 4</label>
    <%=Html.DropDownList("Indice4", Model.Indices4.CreateSelectList<IndiceForm>("Id", "Nombre"),
		"Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Indice4")%>
</p>