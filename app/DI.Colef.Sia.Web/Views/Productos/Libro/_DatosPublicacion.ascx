<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<LibroForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Nombre del libro</label>
    <%=Html.TextBox("Nombre", Model.Nombre, new { @class = "input420-bold-requerido", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Nombre")%>
</p>
<p>
    <label>Tipo de publicaci&oacute;n</label>
    <%=Html.DropDownList("FormatoPublicacion", Model.FormatosPublicaciones.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "coautores requerido" })%>
    <%=Html.ValidationMessage("FormatoPublicacion")%>
</p>
<p>
    <label>Tipo de producto</label>
    <%=Html.DropDownList("TipoProducto", Model.TiposProductos.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("TipoProducto")%>
</p>
<p>
    <label>Contenido del libro</label>
    <%=Html.DropDownList("ContenidoLibro", Model.ContenidosLibros.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
        "Seleccione ...")%>
    <%=Html.ValidationMessage("ContenidoLibro")%>
</p>
<p class="memoriaevento_field">
    <label>Nombre del evento</label>
    <%=Html.TextBox("EventoNombre", Model.EventoNombre,
        new { @class = "autocomplete buscar-requerido", url = Url.Action("Search", "Evento"), maxlength = 100 })%>
    <%=Html.Hidden("EventoId", Model.EventoId, new { rel = "#EventoNombre" })%>
    <%=Html.ValidationMessage("EventoNombre")%>
</p>
<div id="eventoNew" class="minilistaboton memoriaevento_field">
    <p>
        <label></label>
	    <span>
		    <%=Html.ActionLink("+ Nuevo evento", "NewEvento", new { Id = Model.Id }, new { @class = "remote get" })%>
	    </span>
    </p>
</div><!--end minilistaboton-->

<div id="eventoForm" class="display:hidden;"></div>

<div class="revista_field">
    <% Html.RenderPartial("_ShowRevista", new ShowFieldsForm { RevistaPublicacionId = Model.RevistaPublicacionId, RevistaPublicacionTitulo = Model.RevistaPublicacionTitulo, RevistaLabel = "Nombre de la revista", IsShowForm = false, UrlAction = "Search", Rel = "" }); %>
</div>
<p class="revista_field">
    <label>N&uacute;mero</label>
    <%=Html.TextBox("Numero", Model.Numero, new { @class = "input100-requerido", maxlength = 4 })%>
    <%=Html.ValidationMessage("Numero")%>
</p>