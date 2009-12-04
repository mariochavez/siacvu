<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ObraTraducidaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<div class="Articulo_fields"> 
    <% Html.RenderPartial("_ShowRevista", new ShowFieldsForm { RevistaPublicacionId = Model.RevistaPublicacionId, RevistaPublicacionTitulo = Model.RevistaPublicacionTitulo, RevistaLabel = "Nombre de la revista", IsShowForm = false }); %>
</div>
<p class="ArticuloCapituloLibro_fields">
    <label>Volumen</label>
    <%=Html.TextBox("Volumen", Model.Volumen, new { @class = "input250", maxlength = 4 })%>
    <%=Html.ValidationMessage("Volumen")%>
</p>
<p class="Articulo_fields">
    <label>N&uacute;mero</label>
    <%=Html.TextBox("Numero", Model.Numero, new { @class = "input250", maxlength = 4 })%>
    <%=Html.ValidationMessage("Numero")%>
</p>
<p class="Articulo_fields">
    <label>De la p&aacute;gina</label>
    <%=Html.TextBox("PaginaInicial", Model.PaginaInicial, new { @class = "input250", maxlength = 4 })%>
    <%=Html.ValidationMessage("PaginaInicial")%>
</p>
<p class="Articulo_fields">
    <label>A la p&aacute;gina</label>
    <%=Html.TextBox("PaginaFinal", Model.PaginaFinal, new { @class = "input250", maxlength = 4 })%>
    <%=Html.ValidationMessage("PaginaFinal")%>
</p>
<p class="Capitulo_fields">
    <label>Nombre del libro</label>
    <%=Html.TextBox("NombreLibro", Model.NombreLibro, new { @class = "input250", maxlength = 100 })%>
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
        "Seleccione ...")%>
    <%=Html.ValidationMessage("TipoLibro")%>
</p>
<div class="CapituloLibro_fields">
    <% Html.RenderPartial("_EditEditorial", new EditorialForm { Editoriales = Model.EditorialObraTraducidas, ModelId = Model.Id } ); %>
</div>
<p class="Capitulo_fields">
    <label>Resumen</label>
    <%=Html.TextBox("Resumen", Model.Resumen, new { @class = "input250", maxlength = 100 })%>
    <%=Html.ValidationMessage("Resumen")%>
</p>
<p class="CapituloLibro_fields">
    <label>No. de p&aacute;ginas</label>
    <%=Html.TextBox("NoPaginas", Model.NoPaginas, new { @class = "input250", maxlength = 4 })%>
    <%=Html.ValidationMessage("NoPaginas")%>
</p>
<p class="Capitulo_fields">
    <label>No. de citas</label>
    <%=Html.TextBox("NoCitas", Model.NoCitas, new { @class = "input250", maxlength = 4 })%>
    <%=Html.ValidationMessage("NoCitas")%>
</p>
<p class="Libro_fields">
    <label>ISBN</label>
    <%=Html.TextBox("ISBN", Model.ISBN, new { @class = "input250", maxlength = 100 })%>
    <%=Html.ValidationMessage("ISBN")%>
</p>
<p class="Libro_fields">
    <label>Reimpresi&oacute;n</label>
    <%=Html.DropDownList("Reimpresion", Model.Reimpresiones.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
        "Seleccione ...")%>
    <%=Html.ValidationMessage("Reimpresion")%>
</p>
<p class="Libro_fields">
    <label>Tiraje</label>
    <%=Html.TextBox("Tiraje", Model.Tiraje, new { @class = "input250", maxlength = 4 })%>
    <%=Html.ValidationMessage("Tiraje")%>
</p>
