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
<p id="articulo_field">
    <label>Nombre de la revista</label>
    <%=Html.TextBox("RevistaPublicacionTitulo", Model.RevistaPublicacionTitulo,
        new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "RevistaPublicacion"), maxlength = 100 }) %>
    <%=Html.Hidden("RevistaPublicacionId", Model.RevistaPublicacionId, new { rel = "#RevistaPublicacionTitulo" })%>
    <%=Html.ValidationMessage("RevistaPublicacionTitulo")%>
</p>
<p id="capituloLibro_field">
	<label>Editorial</label>
	<%=Html.DropDownList("Editorial", Model.Editoriales.CreateSelectList<EditorialForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
	<%=Html.ValidationMessage("Editorial")%>
</p>
<p id="proyecto_field">
	<label>Tipo de proyecto</label>
	<%=Html.DropDownList("FondoConacyt", Model.FondosConacyt.CreateSelectList<FondoConacytForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
	<%=Html.ValidationMessage("FondoConacyt")%>
</p>