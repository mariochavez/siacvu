<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResenaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div id="tipoPublicacion_field">
    <p>
        <label>Revista en que se publica</label>
        <%=Html.TextBox("RevistaPublicacionTitulo", Model.RevistaPublicacionTitulo,
            new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "RevistaPublicacion"), maxlength = 100 }) %>
        <%=Html.Hidden("RevistaPublicacionId", Model.RevistaPublicacionId, new { rel = "#RevistaPublicacionTitulo", url = Url.Action("ChangeRevista") })%>
        <%=Html.ValidationMessage("RevistaPublicacionTitulo")%>
    </p>
    <p>
        <label>Instituci&oacute;n</label>
        <span id="institucion"><%= Html.Encode(Model.RevistaPublicacionInstitucionNombre)%>&nbsp;</span>
    </p>
    <p>
        <label>Pa&iacute;s</label>
        <span id="pais"><%= Html.Encode(Model.RevistaPublicacionPaisNombre)%>&nbsp;</span>
    </p>
    <p>
	    <label>L&iacute;nea tem&aacute;tica</label>
        <%=Html.TextBox("LineaTematicaNombre", Model.LineaTematicaNombre,
                        new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "LineaTematica"), maxlength = 100 })%>
        <%=Html.Hidden("LineaTematicaId", Model.LineaTematicaId, new { rel = "#LineaTematicaNombre" })%>
        <%=Html.ValidationMessage("LineaTematicaNombre")%>
    </p>
    <p>
	    <label>&Aacute;rea tem&aacute;tica</label>
	    <%=Html.DropDownList("AreaTematica", Model.AreasTematicas.CreateSelectList<AreaTematicaForm>("Id", "Nombre"),
            "Seleccione ...", new { @class = "requerido" })%>
	    <%=Html.ValidationMessage("AreaTematica")%>
    </p>
    <p>
        <label>Estatus de la publicaci&oacute;n</label>
        <%=Html.DropDownList("EstadoProducto", Model.EstadosProductos.CreateSelectList<EstadoProductoForm>("Id", "Nombre"),
            "Seleccione ...", new { @class = "requerido" })%>
        <%=Html.ValidationMessage("EstadoProducto") %>
    </p>
    <p id="EstatusAceptado">
        <label>Fecha de aceptaci&oacute;n</label>
        <%=Html.TextBox("FechaAceptacion", Model.FechaAceptacion, new { @class = "datetime input100-requerido", maxlength = 10 })%>
        <span>(Formato dd/mm/yyyy)</span>
        <%=Html.ValidationMessage("FechaAceptacion")%>
    </p>
    <p id="EstatusPublicado">
        <label>Fecha de publicaci&oacute;n</label>
        <%=Html.TextBox("FechaPublicacion", Model.FechaPublicacion, new { @class = "datetime input100-requerido", maxlength = 10 })%>
        <span>(Formato dd/mm/yyyy)</span>
        <%=Html.ValidationMessage("FechaPublicacion")%>
    </p>
</div>
<p>
    <label>Volumen</label>
    <%=Html.TextBox("Volumen", Model.Volumen, new { @class = "input100-requerido", maxlength = 4, size = 14 })%>
    <%=Html.ValidationMessage("Volumen")%>										
</p>
<p>
    <label>N&uacute;mero</label>
    <%=Html.TextBox("Numero", Model.Numero, new { @class = "input100-requerido", maxlength = 4, size = 14 })%>
    <%=Html.ValidationMessage("Numero")%>										
</p>
<p>
    <label>P&aacute;gina inicial</label>
    <%=Html.TextBox("PaginaInicial", Model.PaginaInicial, new { @class = "input100-requerido", maxlength = 4, size = 14 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("PaginaInicial")%>										
</p>
<p>
    <label>P&aacute;gina final</label>
    <%=Html.TextBox("PaginaFinal", Model.PaginaFinal, new { @class = "input100-requerido", maxlength = 4, size = 14 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("PaginaFinal")%>
</p>
<%if(Model.Id != 0){ %>
    <p>
        <label>A&ntilde;o de publicaci&oacute;n</label>
        <%=Html.Encode(Model.AnioPublicacion) %>
        <span class="cvu"></span>
    </p>
<% } %>
<p>
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
<p>
	<label>Periodo de referencia</label>
	<%=Html.Encode(Model.PeriodoReferenciaPeriodo)%>
</p>