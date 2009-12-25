<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ObraTraducidaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<div class="Articulo_fields"> 
    <% Html.RenderPartial("_ShowRevista", new ShowFieldsForm { RevistaPublicacionId = Model.RevistaPublicacionId, RevistaPublicacionTitulo = Model.RevistaPublicacionTitulo, RevistaLabel = "Nombre de la revista", IsShowForm = false, UrlAction = "Search", Rel = "" }); %>
</div>
<p class="Capitulo_fields">
    <label>Nombre del libro</label>
    <%=Html.TextBox("NombreLibro", Model.NombreLibro, new { @class = "input420-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("NombreLibro")%>
</p>
<div class="Capitulo_fields">
    <h4>Autor(es) del libro</h4>
    <% Html.RenderPartial("_EditAutorInterno", new AutorForm { AutoresInternos = Model.AutorInternoObraTraducidas, ModelId = Model.Id }); %>
    <% Html.RenderPartial("_EditAutorExterno", new AutorForm { AutoresExternos = Model.AutorExternoObraTraducidas, ModelId = Model.Id } ); %>
</div>
<p class="Capitulo_fields">
    <label>Tipo de libro</label>
    <%=Html.DropDownList("TipoLibro", Model.TiposLibro.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("TipoLibro")%>
</p>
<div class="CapituloLibro_fields">
    <% Html.RenderPartial("_EditEditorial", new EditorialForm { Editoriales = Model.EditorialObraTraducidas, ModelId = Model.Id } ); %>
</div>
<p class="Capitulo_fields">
    <label>Resumen</label>
    <%=Html.TextArea("Resumen", Model.Resumen, 4, 35, new { @class = "input420-requerido", maxlength = 300 })%>
    <%=Html.ValidationMessage("Resumen")%>
</p>
<p class="Libro_fields">
    <label>ISBN</label>
    <%=Html.TextBox("ISBN", Model.ISBN, new { @class = "input420-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("ISBN")%>
</p>
<p class="Libro_fields">
    <label>Edici&oacute;n</label>
    <%=Html.DropDownList("Edicion", Model.Ediciones.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Edicion")%>
</p>
<p class="Libro_fields">
    <label>Reimpresi&oacute;n</label>
    <%=Html.DropDownList("Reimpresion", Model.Reimpresiones.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Reimpresion")%>
</p>
<p class="ArticuloCapituloLibro_fields">
    <label>Volumen</label>
    <%=Html.TextBox("Volumen", Model.Volumen, new { @class = "input100-requerido", maxlength = 4 })%>
    <%=Html.ValidationMessage("Volumen")%>
</p>
<p class="Articulo_fields">
    <label>N&uacute;mero</label>
    <%=Html.TextBox("Numero", Model.Numero, new { @class = "input100-requerido", maxlength = 4 })%>
    <%=Html.ValidationMessage("Numero")%>
</p>
<p class="ArticuloCapitulo_fields">
    <label>De la p&aacute;gina</label>
    <%=Html.TextBox("PaginaInicial", Model.PaginaInicial, new { @class = "input100-requerido", maxlength = 4 })%>
    <%=Html.ValidationMessage("PaginaInicial")%>
</p>
<p class="ArticuloCapitulo_fields">
    <label>A la p&aacute;gina</label>
    <%=Html.TextBox("PaginaFinal", Model.PaginaFinal, new { @class = "input100-requerido", maxlength = 4 })%>
    <%=Html.ValidationMessage("PaginaFinal")%>
</p>
<p class="Libro_fields">
    <label>N&uacute;mero de p&aacute;ginas</label>
    <%=Html.TextBox("NoPaginas", Model.NoPaginas, new { @class = "input100-requerido", maxlength = 4 })%>
    <%=Html.ValidationMessage("NoPaginas")%>
</p>
<p class="Capitulo_fields">
    <label>N&uacute;mero de citas</label>
    <%=Html.TextBox("NoCitas", Model.NoCitas, new { @class = "input100-requerido", maxlength = 4 })%>
    <%=Html.ValidationMessage("NoCitas")%>
</p>
<p class="Libro_fields">
    <label>Tiraje</label>
    <%=Html.TextBox("Tiraje", Model.Tiraje, new { @class = "input100-requerido", maxlength = 4 })%>
    <%=Html.ValidationMessage("Tiraje")%>
</p>
