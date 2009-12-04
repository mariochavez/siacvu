<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl" %>
<div id="caja-busqueda">
    <% using (Html.BeginForm("Search", null, FormMethod.Post, new { Id = "SearchForm"} )) { %>
        <%=Html.Hidden("SearchId") %>
    <% } %>
    <p>
        <%=Html.TextBox("SearchValue", "Buscar ...", new { @class = "inputbusqueda clearField" })%>
        <%=Html.ActionLink("Editar", "Search", null, new { @class = "searchAutoComplete editabusqueda", rel = "#SearchValue", id = "Search" })%>
    </p>
</div>
