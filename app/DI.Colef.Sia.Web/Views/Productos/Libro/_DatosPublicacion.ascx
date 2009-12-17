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
    <label>Formato de publicaci&oacute;n</label>
    <%=Html.DropDownList("FormatoPublicacion", Model.FormatosPublicaciones.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
        "Seleccione ...")%>
    <%=Html.ValidationMessage("FormatoPublicacion")%>
</p>
<p>
    <label>Tipo de producto</label>
    <%=Html.DropDownList("TipoProducto", Model.TiposProductos.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
        "Seleccione ...")%>
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
        new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "Evento"), maxlength = 100 })%>
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
    <% Html.RenderPartial("_ShowRevista", new ShowFieldsForm { RevistaPublicacionId = Model.RevistaPublicacionId, RevistaPublicacionTitulo = Model.RevistaPublicacionTitulo, RevistaLabel = "Nombre de la revista", IsShowForm = false }); %>
</div>
<p class="revista_field">
    <label>N&uacute;mero</label>
    <%=Html.TextBox("Numero", Model.Numero, new { @class = "input100-requerido", maxlength = 4 })%>
    <%=Html.ValidationMessage("Numero")%>
</p>
<p>
    <label></label>
    <%= Html.CheckBox("TieneProyecto", Model.TieneProyecto) %> ¿Existe proyecto de investigaci&oacute;n de referencia?
</p>
<div id="tieneproyecto_field">
    <% Html.RenderPartial("_ShowProyecto", new ShowFieldsForm { ProyectoId = Model.ProyectoId, ProyectoNombre = Model.ProyectoNombre, IsShowForm = false}); %>
</div>

<% Html.RenderPartial("_ShowAreaTematica", new ShowFieldsForm { AreaTematicaId = Model.AreaTematicaId, AreaTematicaNombre = Model.AreaTematicaNombre, IsShowForm = false}); %>
<% Html.RenderPartial("_ShowPalabrasClave", new ShowFieldsForm { PalabraClave1 = Model.PalabraClave1, PalabraClave2 = Model.PalabraClave2, PalabraClave3 = Model.PalabraClave3, IsShowForm = false }); %>
<% Html.RenderPartial("_ShowSubdisciplina", new ShowFieldsForm { Areas = Model.Areas, Disciplinas = Model.Disciplinas, Subdisciplinas = Model.Subdisciplinas, IsShowForm = false }); %>