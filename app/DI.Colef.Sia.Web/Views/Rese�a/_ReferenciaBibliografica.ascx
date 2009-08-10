<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ReseñaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
        <td class="label">
			<label>Referencia Bibliografica Libro:</label>
			<br />
            <%=Html.TextBox("ReferenciaBibliograficaLibro", Model.ReferenciaBibliograficaLibro, new { maxlength = 100, size = 40})%>
			<%=Html.ValidationMessage("ReferenciaBibliograficaLibro")%>
        </td>
        <td class="label">
		    <label>Referencia Bibliografica Revista:</label>
		    <br />
            <%=Html.TextBox("ReferenciaBibliograficaRevista", Model.ReferenciaBibliograficaRevista, new { maxlength = 100, size = 40})%>
			<%=Html.ValidationMessage("ReferenciaBibliograficaRevista")%>
        </td>
    </tr>
    <tr>
        <td class="label">
			<label>Nombre Producto:</label>
			<br />
			<%=Html.TextBox("NombreProducto", Model.NombreProducto, new { maxlength = 100 })%>
			<%=Html.ValidationMessage("NombreProducto")%>									
        </td>
        <td class="label">
			<label>Pais:</label>
			<br />
			<%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
					"Seleccione ...")%>
			<%=Html.ValidationMessage("Pais") %>
        </td>
    </tr>
    <tr>
        <td class="label">
            <label>Pagina Inicial:</label>
            
            <label>Pagina Final:</label>
            <br />
            <%=Html.TextBox("PaginaInicial", Model.PaginaInicial, new { maxlength = 10, size = 14 })%>
            <%=Html.ValidationMessage("PaginaInicial")%>										
            -
            <%=Html.TextBox("PaginaFinal", Model.PaginaFinal, new { maxlength = 10, size = 14 })%>
            <%=Html.ValidationMessage("PaginaFinal")%>
        </td>
        <td class="label">
			<label>Titulo Libro:</label>
			<br />
            <%=Html.TextBox("TituloLibro", Model.TituloLibro, new { maxlength = 100 })%>
			<%=Html.ValidationMessage("TituloLibro")%>
        </td>
    </tr>
    <tr>
        <td class="label">
			<label>Nombre Revista:</label>
			<br />
			<%=Html.TextBox("NombreRevista", Model.NombreRevista, new { maxlength = 100 })%>
			<%=Html.ValidationMessage("NombreRevista")%>
        </td>
        <td class="label">
			<label>Editorial:</label>
			<br />
			<%=Html.TextBox("Editorial", Model.Editorial, new { maxlength = 100 })%>
			<%=Html.ValidationMessage("Editorial")%>
        </td>
    </tr>
</table>
