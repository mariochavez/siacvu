<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>
        Nombre del Libro:</label>
    <%=Html.TextBox("NombreLibro", Model.NombreLibro, new { maxlength = 100 })%>
    <%=Html.ValidationMessage("NombreLibro")%>
</p>
<p>
    <label>
        Editorial:</label>
    <%=Html.TextBox("Editorial", Model.Editorial, new { maxlength = 100 })%>
    <%=Html.ValidationMessage("Editorial")%>
</p>
<p>
    <label>
        Pais:</label>
    <%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
				"Seleccione ...")%>
    <%=Html.ValidationMessage("Pais") %>
</p>
<p>
    <label>
        No. de Paginas:</label>
    <%=Html.TextBox("NoPaginas", Model.NoPaginas, new { maxlength = 100 })%>
    <%=Html.ValidationMessage("NoPaginas")%>
</p>