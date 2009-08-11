<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl" %>
<span class="inputSearchField">
    <% using (Html.BeginForm("Search", null, FormMethod.Post, new { Id = "SearchForm"} )) { %>
        <%=Html.Hidden("SearchId") %>
    <% } %>
    <%=Html.TextBox("SearchValue", "Buscar ...",
        new { @class = "clearField inputSearch" })%>
</span>
<span class="btn btn_small_white">
    <%=Html.ActionLink("Editar", "Search", null, new { @class = "searchAutoComplete", rel = "#SearchValue", id = "Search" })%>
</span>
