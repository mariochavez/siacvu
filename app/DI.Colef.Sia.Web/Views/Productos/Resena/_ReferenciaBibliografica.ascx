<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResenaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
	<label>Referencia Bibliogr&aacute;fica Libro</label>
    <%=Html.TextBox("ReferenciaBibliograficaLibro", Model.ReferenciaBibliograficaLibro, new { @class = "input250-requerido", maxlength = 100, size = 40 })%>
	<%=Html.ValidationMessage("ReferenciaBibliograficaLibro")%>
</p>
<p>
    <label>Referencia Bibliogr&aacute;fica Revista</label>
    <%=Html.TextBox("ReferenciaBibliograficaRevista", Model.ReferenciaBibliograficaRevista, new { @class = "input250-requerido", maxlength = 100, size = 40 })%>
	<%=Html.ValidationMessage("ReferenciaBibliograficaRevista")%>
</p>
<p>
	<label>Nombre Producto</label>
	<%=Html.TextBox("NombreProducto", Model.NombreProducto, new { @class = "input250-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("NombreProducto")%>									
</p>
<p>
	<label>Pa&iacute;s</label>
	<%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
			"Seleccione ...")%>
	<%=Html.ValidationMessage("Pais") %>
</p>
<p>
    <label>Pagina Inicial</label>
    <%=Html.TextBox("PaginaInicial", Model.PaginaInicial, new { @class = "input250-requerido", maxlength = 10, size = 5 })%>
    <%=Html.ValidationMessage("PaginaInicial")%>										
</p>
<p>
    <label>Pagina Final</label>
    <%=Html.TextBox("PaginaFinal", Model.PaginaFinal, new { @class = "input250-requerido", maxlength = 10, size = 5 })%>
    <%=Html.ValidationMessage("PaginaFinal")%>
</p>
<p>
	<label>Titulo Libro</label>
    <%=Html.TextBox("TituloLibro", Model.TituloLibro, new { @class = "input250-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("TituloLibro")%>
</p>
<p>
	<label>Nombre Revista</label>
	<%=Html.TextBox("NombreRevista", Model.NombreRevista, new { @class = "input250-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("NombreRevista")%>
</p>
<p>
	<label>Editorial</label>
	<%=Html.TextBox("Editorial", Model.Editorial, new { @class = "input250-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("Editorial")%>
</p>