<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResenaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
	<label>Nombre del producto</label>
	<%=Html.TextBox("NombreProducto", Model.NombreProducto, new { @class = "input350-bold-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("NombreProducto")%>									
</p>
<p>
	<label>Nombre de la revista</label>
	<%=Html.TextBox("NombreRevista", Model.NombreRevista, new { @class = "input250-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("NombreRevista")%>
</p>
<p>
    <label>Referencia bibliogr&aacute;fica del libro</label>
    <%=Html.TextArea("ReferenciaBibliograficaLibro", Model.ReferenciaBibliograficaLibro, 3, 35, new { @class = "input250-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("ReferenciaBibliograficaLibro")%>
    <span>(Referencia bibliogr&aacute;fica)</span>
</p>
<p>
    <label>Referencia bibliogr&aacute;fica de la revista</label>
    <%=Html.TextArea("ReferenciaBibliograficaRevista", Model.ReferenciaBibliograficaRevista, 3, 35, new { @class = "input250-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("ReferenciaBibliograficaRevista")%>
    <span>(Referencia bibliogr&aacute;fica)</span>
</p>
<p>
	<label>Pa&iacute;s</label>
	<%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
	<%=Html.ValidationMessage("Pais") %>
</p>
<p>
    <label>P&aacute;gina inicial</label>
    <%=Html.TextBox("PaginaInicial", Model.PaginaInicial, new { @class = "input250-requerido", maxlength = 10, size = 5 })%>
    <%=Html.ValidationMessage("PaginaInicial")%>										
</p>
<p>
    <label>P&aacute;gina final</label>
    <%=Html.TextBox("PaginaFinal", Model.PaginaFinal, new { @class = "input250-requerido", maxlength = 10, size = 5 })%>
    <%=Html.ValidationMessage("PaginaFinal")%>
</p>
<p>
	<label>T&iacute;tulo del libro</label>
    <%=Html.TextBox("TituloLibro", Model.TituloLibro, new { @class = "input250-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("TituloLibro")%>
</p>
<p>
	<label>Editorial</label>
	<%=Html.TextBox("Editorial", Model.Editorial, new { @class = "input250-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("Editorial")%>
</p>