<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<LibroForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Nombre del libro</label>
    <%=Html.TextBox("Nombre", Model.Nombre, new { @class = "input420-bold-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("Nombre")%>
</p>
<p>
    <label>Tipo de publicaci&oacute;n</label>
    <%=Html.DropDownList("TipoPublicacion", Model.TiposPublicaciones.CreateSelectList<TipoPublicacionForm>("Id", "Nombre"),
        "Seleccione ...")%>
    <%=Html.ValidationMessage("TipoPublicacion") %>
</p>
<p>
    <label>Tipo de producto</label>
    <%=Html.DropDownList("TipoProducto", Model.TiposProductos.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
        "Seleccione ...")%>
    <%=Html.ValidationMessage("TipoProducto")%>
</p>
<p>
    <label>Formato de publicaci&oacute;n</label>
    <%=Html.DropDownList("FormatoPublicacion", Model.FormatosPublicaciones.CreateSelectList<FormatoPublicacionForm>("Id", "Nombre"),
        "Seleccione ...")%>
    <%=Html.ValidationMessage("FormatoPublicacion")%>
</p>
<p class="memoriaevento_field">
    <label>Nombre del evento</label>
    <%=Html.DropDownList("Evento", Model.Eventos.CreateSelectList<EventoForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido cascade", rel = Url.Action("ChangeEvento")})%>
    <%=Html.ValidationMessage("Evento")%>
</p>
<p class="memoriaevento_field">
    <label>Fecha del evento</label>
    <span id="fechaevento"><%= Html.Encode(Model.EventoFechaInicial)%> - <%= Html.Encode(Model.EventoFechaFinal)%>&nbsp;</span>
</p>
<p class="revista_field">
    <label>Nombre de la revista</label>
    <%=Html.TextBox("NombreRevistaTitulo", Model.NombreRevistaTitulo, 
        new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "RevistaPublicacion"), maxlength = 100 }) %>
    <%=Html.Hidden("NombreRevistaId", Model.NombreRevistaId, new { rel = "#NombreRevistaTitulo", url = Url.Action("ChangeRevista") })%>
    <%=Html.ValidationMessage("NombreRevistaTitulo") %>
</p>
<p class="revista_field">
    <label>Instituci&oacute;n</label>
    <span id="institucion"><%= Html.Encode(Model.NombreRevistaInstitucionNombre)%>&nbsp;</span>
</p>
<p class="revista_field">
    <label>N&uacute;mero</label>
    <%=Html.TextBox("Numero", Model.Numero, new { @class = "input100-requerido", maxlength = 4 })%>
    <%=Html.ValidationMessage("Numero")%>
</p>
<p class="idioma_field">
    <label>Idioma al que se tradujo</label>
    <%=Html.DropDownList("Idioma", Model.Idiomas.CreateSelectList<IdiomaForm>("Id", "Nombre"),
                        "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Idioma") %>
</p>
<p class="idioma_field">
    <label>Nombre del traductor</label>
    <%= Html.TextBox("NombreTraductor", Model.NombreTraductor, new { @class = "input250-requerido", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("NombreTraductor")%>
</p>