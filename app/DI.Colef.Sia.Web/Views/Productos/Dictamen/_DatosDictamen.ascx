<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<DictamenForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
	<label>
        T&iacute;tulo del producto dictaminado</label>
    <%=Html.TextBox("Nombre", Model.Nombre, new { @class = "input420-bold-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("Nombre")%>
</p>
<p>
    <label>Fecha de dictamen</label>
    <%=Html.TextBox("FechaDictamen", Model.FechaDictamen, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/aaaa)</span>
    <%=Html.ValidationMessage("FechaDictamen")%>
</p>
<p>
	<label>Producto dictaminado</label>
	<%=Html.DropDownList("TipoDictamen", Model.TiposDictamenes.CreateSelectList<TipoDictamenForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("TipoDictamen") %>
</p>
<div id="articulo_field">
    <% Html.RenderPartial("_RevistaPublicacion", Model); %>
    <div class="EstatusPublicado">
        <%--<% Html.RenderPartial("_ReferenciaBibliografica", Model); %>--%>
    </div>
</div>
<div id="libro_field">
    <% Html.RenderPartial("_EditEditorial", Model); %>
</div>
<p id="proyecto_field">
	<label>Tipo de proyecto</label>
	<%=Html.DropDownList("FondoConacyt", Model.FondosConacyt.CreateSelectList<FondoConacytForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
	<%=Html.ValidationMessage("FondoConacyt")%>
</p>