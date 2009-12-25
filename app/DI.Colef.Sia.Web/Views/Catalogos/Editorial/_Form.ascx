<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EditorialForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Nombre de la editorial</label>
    <%=Html.TextBox("Nombre", Model.Nombre, new { @class = "input250-requerido", maxlength = 40 })%>
    <span>(Debe de ser un nombre &uacute;nico)</span>
    <%=Html.ValidationMessage("Nombre") %>
</p>
<p>
    <label>Instituci&oacute;n</label>
    <%=Html.TextBox("InstitucionNombre", Model.InstitucionNombre,
        new { @class = "autocomplete buscar-requerido", url = Url.Action("Search", "Institucion"), maxlength = 100 })%>
    <%=Html.Hidden("InstitucionId", Model.InstitucionId, new { rel = "#InstitucionNombre" })%>
    <%=Html.ValidationMessage("InstitucionNombre")%>
</p>
<p>
    <label>Tipo de editorial</label>
    <%=Html.DropDownList("TipoEditorial", Model.TipoEditoriales.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
        "Seleccione ...")%>
    <%=Html.ValidationMessage("TipoEditorial")%>
</p>
<p>
    <label>Pa&iacute;s</label>
    <%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Pais") %>
</p>
<p>
    <label>Contacto de la editorial</label>
    <%=Html.TextBox("Contacto", Model.Contacto, new { @class = "input420", maxlength = 40 })%>
    <%=Html.ValidationMessage("Contacto")%>
</p>
<p>
    <label>E-mail</label>
    <%=Html.TextBox("Email", Model.Email, new { @class = "input420", maxlength = 40 })%>
    <%=Html.ValidationMessage("Email")%>
</p>
<p>
    <label>P&aacute;gina Web</label>
    <%=Html.TextBox("PaginaWeb", Model.PaginaWeb, new { @class = "input420", maxlength = 40 })%>
    <%=Html.ValidationMessage("PaginaWeb")%>
</p>
<p>
    <label>Tel&eacute;fono y/o Fax</label>
    <%=Html.TextBox("Telefono", Model.Telefono, new { @class = "input420", maxlength = 40 })%>
    <%=Html.ValidationMessage("Telefono")%>
</p>