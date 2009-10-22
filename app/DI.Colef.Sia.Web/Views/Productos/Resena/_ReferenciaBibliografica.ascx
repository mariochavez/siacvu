<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResenaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Revista en que se publica</label>
    <%=Html.TextBox("RevistaPublicacionTitulo", Model.RevistaPublicacionTitulo,
        new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "RevistaPublicacion"), maxlength = 100 }) %>
    <%=Html.Hidden("RevistaPublicacionId", Model.RevistaPublicacionId, new { rel = "#RevistaPublicacionTitulo" })%>
    <%=Html.ValidationMessage("RevistaPublicacionTitulo")%>
</p>
<p>
    <label>&Aacute;rea tem&aacute;tica</label>
    <%=Html.DropDownList("AreaTematicaId", Model.AreasTematicas.CreateSelectList<AreaTematicaForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("AreaTematicaId")%>
</p>
<p>
    <label>Palabra clave 1</label>
    <%=Html.TextBox("PalabraClave1", Model.PalabraClave1, new { @class = "input250", maxlength = 100 })%>
    <span class="cvu"></span>
</p>
<p>
    <label>Palabra clave 2</label>
    <%=Html.TextBox("PalabraClave2", Model.PalabraClave2, new { @class = "input250", maxlength = 100 })%>
    <span class="cvu"></span>
</p>
<p>
    <label>Palabra clave 3</label>
    <%=Html.TextBox("PalabraClave3", Model.PalabraClave3, new { @class = "input250", maxlength = 100 })%>
    <span class="cvu"></span>
</p>
<p>
    <label>Estatus de la publicaci&oacute;n</label>
    <%=Html.DropDownList("EstadoProducto", Model.EstadosProductos.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("EstadoProducto") %>
</p>
<p id="EstatusAceptado">
    <label>Fecha de aceptaci&oacute;n</label>
    <%=Html.TextBox("FechaAceptacion", Model.FechaAceptacion, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaAceptacion")%>
</p>
<p class="EstatusPublicado">
    <label>Fecha de publicaci&oacute;n</label>
    <%=Html.TextBox("FechaPublicacion", Model.FechaPublicacion, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaPublicacion")%>
</p>
<p class="EstatusPublicado">
    <label>Volumen</label>
    <%=Html.DropDownList("Volumen", Model.Volumenes.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Volumen")%>										
</p>
<p class="EstatusPublicado">
    <label>N&uacute;mero</label>
    <%=Html.TextBox("Numero", Model.Numero, new { @class = "input100-requerido", maxlength = 4, size = 14 })%>
    <%=Html.ValidationMessage("Numero")%>										
</p>
<p class="EstatusPublicado">
    <label>P&aacute;gina inicial</label>
    <%=Html.TextBox("PaginaInicial", Model.PaginaInicial, new { @class = "input100-requerido", maxlength = 4, size = 14 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("PaginaInicial")%>										
</p>
<p class="EstatusPublicado">
    <label>P&aacute;gina final</label>
    <%=Html.TextBox("PaginaFinal", Model.PaginaFinal, new { @class = "input100-requerido", maxlength = 4, size = 14 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("PaginaFinal")%>
</p>
<p class="EstatusPublicado">
    <label></label>
    <%= Html.CheckBox("ResenaTraducida", Model.ResenaTraducida)%> Rese&ntilde;a traducida a otro idioma?
    <span class="cvu"></span>
    <%=Html.ValidationMessage("ResenaTraducida")%>
</p>
<p id="idioma_field">
    <label>Idioma al que se tradujo</label>
    <%=Html.DropDownList("Idioma", Model.Idiomas.CreateSelectList<IdiomaForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Idioma") %>
</p>