<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<DictamenForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
	<label>Producto dictaminado</label>
	<%=Html.DropDownList("TipoDictamen", Model.TiposDictamenes.CreateSelectList<TipoDictamenForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("TipoDictamen") %>
</p>
<p class="articulo_field">
    <label>Nombre de la revista</label>
    <%=Html.TextBox("RevistaPublicacionTitulo", Model.RevistaPublicacionTitulo,
        new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "RevistaPublicacion"), maxlength = 100 }) %>
    <%=Html.Hidden("RevistaPublicacionId", Model.RevistaPublicacionId, new { rel = "#RevistaPublicacionTitulo", url = Url.Action("ChangeRevista") })%>
    <%=Html.ValidationMessage("RevistaPublicacionTitulo")%>
</p>
<p class="articulo_field">
    <label>Instituci&oacute;n de la revista</label>
    <span id="institucionrevista"><%= Html.Encode(Model.RevistaPublicacionInstitucionNombre)%>&nbsp;</span>
</p>
<p class="capituloLibro_field">
	<label>Editorial</label>
	<%=Html.DropDownList("Editorial", Model.Editoriales.CreateSelectList<EditorialForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido cascade", rel = Url.Action("ChangeEditorial") })%>
	<%=Html.ValidationMessage("Editorial")%>
</p>
<p class="capituloLibro_field">
    <label>Instituci&oacute;n de la editorial</label>
    <span id="institucioneditorial"><%= Html.Encode(Model.EditorialInstitucionNombre)%>&nbsp;</span>
</p>
<p id="proyecto_field">
	<label>Tipo de proyecto</label>
	<%=Html.DropDownList("FondoConacyt", Model.FondosConacyt.CreateSelectList<FondoConacytForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
	<%=Html.ValidationMessage("FondoConacyt")%>
</p>