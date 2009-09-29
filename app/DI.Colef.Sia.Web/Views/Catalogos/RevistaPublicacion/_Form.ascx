<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<RevistaPublicacionForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>T&iacute;tulo</label>
    <%=Html.TextBox("Titulo", Model.Titulo, new { @class = "input250-requerido", maxlength = 40 })%>
    <span>(Debe de ser un nombre &uacute;nico)</span>
    <%=Html.ValidationMessage("Titulo")%>
</p>
<p>
    <label>Periodicidad</label>
    <%=Html.TextBox("Periodicidad", Model.Periodicidad, new { @class = "input250", maxlength = 40 })%>
    <%=Html.ValidationMessage("Periodicidad")%>
</p>
<p>
    <label>Issn</label>
    <%=Html.TextBox("Issn", Model.Issn, new { @class = "input250", maxlength = 40 })%>
    <%=Html.ValidationMessage("Issn")%>
</p>
<p>
    <label>Detalle</label>
    <%=Html.TextBox("Detalle", Model.Detalle, new { @class = "input250", maxlength = 40 })%>
    <%=Html.ValidationMessage("Detalle")%>
</p>
<p>
    <label>Tipo</label>
    <%=Html.TextBox("Tipo", Model.Tipo, new { @class = "input250", maxlength = 40 })%>
    <%=Html.ValidationMessage("Tipo")%>
</p>
<p>
    <label>Estado</label>
    <%=Html.TextBox("Estado", Model.Estado, new { @class = "input250", maxlength = 40 })%>
    <%=Html.ValidationMessage("Estado")%>
</p>
<p>
    <label>Instituci&oacute;n</label>
    <%=Html.TextBox("InstitucionNombre", Model.InstitucionNombre,
        new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "Institucion"), maxlength = 100 })%>
    <%=Html.Hidden("InstitucionId", Model.InstitucionId, new { rel = "#InstitucionNombre" })%>
    <%=Html.ValidationMessage("InstitucionNombre")%>
</p>
<p>
    <label>Pa&iacute;s</label>
    <%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Pais") %>
</p>
<p>
    <label>&Iacute;ndice 1</label>
    <%=Html.DropDownList("Indice1", Model.Indices1.CreateSelectList<IndiceForm>("Id", "Nombre"),
                "Seleccione ...")%>
    <%=Html.ValidationMessage("Indice1")%>
</p>
<p>
    <label>&Iacute;ndice 2</label>
    <%=Html.DropDownList("Indice2", Model.Indices2.CreateSelectList<IndiceForm>("Id", "Nombre"),
                "Seleccione ...")%>
    <%=Html.ValidationMessage("Indice2")%>
</p>
<p>
    <label>&Iacute;ndice 3</label>
    <%=Html.DropDownList("Indice3", Model.Indices3.CreateSelectList<IndiceForm>("Id", "Nombre"),
                "Seleccione ...")%>
    <%=Html.ValidationMessage("Indice3")%>
</p>
