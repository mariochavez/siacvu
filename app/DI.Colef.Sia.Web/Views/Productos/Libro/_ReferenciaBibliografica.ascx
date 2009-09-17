<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<LibroForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Nombre del libro</label>
    <%=Html.TextBox("Nombre", Model.Nombre, new { @class = "input420-bold-requerido", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Nombre")%>
</p>
<p class="publicado_field">
    <label>ISBN</label>
    <%=Html.TextBox("ISBN", Model.ISBN, new { @class = "input250", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("ISBN")%>
</p>
<p>
    <label>Editorial</label>
    <%=Html.TextBox("Editorial", Model.Editorial, new { @class = "input250-requerido", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Editorial")%>
</p>
<p>
    <label>Edici&oacute;n</label>
    <%=Html.DropDownList("Edicion", Model.Ediciones.CreateSelectList<EdicionForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <span class="cvu"></span>                
    <%=Html.ValidationMessage("Edicion")%>
</p>
<p class="publicado_field">
    <label>Fecha de edici&oacute;n</label>
    <%=Html.TextBox("FechaEdicion", Model.FechaEdicion, new { @class = "datetime input100", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("FechaEdicion")%>
</p>
<p>
    <label>Pa&iacute;s</label>
    <%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Pais") %>
</p>
<p>
    <label>No. de p&aacute;ginas</label>
    <%=Html.TextBox("NoPaginas", Model.NoPaginas, new { @class = "input100-requerido", maxlength = 4})%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("NoPaginas")%>
</p>
<p>
    <label>Tiraje</label>
    <%=Html.TextBox("Tiraje", Model.Tiraje, new { @class = "input100", maxlength = 5 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Tiraje")%>
</p>
<p class="coordinacionrevista_field">
    <label>Volumen</label>
    <%=Html.TextBox("Volumen", Model.Volumen, new { @class = "input100", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Volumen")%>
</p>
<p class="coordinacionrevista_field">
    <label>N&uacute;mero</label>
    <%=Html.TextBox("Numero", Model.Numero, new { @class = "input100", maxlength = 4 })%>
    <%=Html.ValidationMessage("Numero")%>
</p>
<p class="coordinacionmemoria_field">
    <label>Fecha del evento</label>
    <%=Html.TextBox("FechaEvento", Model.FechaEvento, new { @class = "datetime input100", maxlength = 10 })%>
    <%=Html.ValidationMessage("FechaEvento")%>
</p>
<p class="coordinacionrevista_field">
    <label>Instituci&oacute;n</label>
    <%=Html.TextBox("InstitucionNombre", Model.InstitucionNombre,
        new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "Institucion"), maxlength = 100 })%>
    <%=Html.Hidden("InstitucionId", Model.InstitucionId, new { rel = "#InstitucionNombre" })%>
    <%=Html.ValidationMessage("InstitucionNombre") %>
</p>
<p class="coordinacionrevista_field">
    <label>Nombre de la revista</label>
    <%=Html.TextBox("NombreRevistaTitulo", Model.NombreRevistaTitulo, 
        new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "RevistaPublicacion"), maxlength = 100 }) %>
    <%=Html.Hidden("NombreRevistaId", Model.NombreRevistaId, new { rel = "#NombreRevistaTitulo" })%>
    <%=Html.ValidationMessage("NombreRevistaTitulo") %>
</p>
<p class="coordinacionmemoria_field">
    <label>Nombre del evento</label>
    <%=Html.DropDownList("NombreEvento", Model.Eventos.CreateSelectList<EventoForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("NombreEvento")%>
</p>