<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<DistincionForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>T&iacute;tulo de la distinci&oacute;n</label>
    <%=Html.TextBox("Titulo", Model.Titulo, new { @class = "input420-bold-requerido", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Titulo")%>
</p>
<p>
    <label>Tipo de distinci&oacute;n</label>
    <%=Html.DropDownList("TipoDistincion", Model.TiposDistinciones.CreateSelectList<TipoDistincionForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("TipoDistincion") %>
</p>
<p>
    <label>Descripci&oacute;n de la distinci&oacute;n</label>
    <%=Html.TextArea("Descripcion", Model.Descripcion, 3, 35, new { @class = "input420-requerido", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Descripcion")%>
</p>
<p>
    <label>Fecha de otorgamiento</label>
    <%=Html.TextBox("FechaOtorgamiento", Model.FechaOtorgamiento, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("FechaOtorgamiento")%>
</p>
<p>
    <label>Instituci&oacute;n</label>
    <%=Html.TextBox("InstitucionNombre", Model.InstitucionNombre,
            new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "Institucion"), maxlength = 100 })%>
    <%=Html.Hidden("InstitucionId", Model.InstitucionId, new { rel = "#InstitucionNombre"})%>
    <%=Html.ValidationMessage("InstitucionNombre")%>
</p>
<p>
    <label>&Aacute;mbito</label>
    <%=Html.DropDownList("Ambito", Model.Ambitos.CreateSelectList<AmbitoForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Ambito") %>
</p>
<p id="ambitopais" class="noeffect">
    <label>Pa&iacute;s</label>
    <%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido"})%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Pais") %>
</p>
<p id="ambitoestatal" class="noeffect">
    <label>Estado</label>
    <%=Html.DropDownList("EstadoPais", Model.EstadosPaises.CreateSelectList<EstadoPaisForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("EstadoPais") %>
</p>
<p class="ambitoestatallocal">
    <label>Municipio</label>
    <%=Html.TextBox("Municipio", Model.Municipio, new { @class = "input420", maxlength = 100 })%>
    <%=Html.ValidationMessage("Municipio")%>
</p>