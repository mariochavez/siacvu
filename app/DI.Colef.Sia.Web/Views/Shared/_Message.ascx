<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl" %>
<div id="message" class="<% if((ViewData["message"] ?? TempData["message"])!= null) { %>
        message
    <% } else if((ViewData["error"] ?? TempData["error"]) != null) { %>
        errormessage
    <% } %>">
    <%=Html.Encode(ViewData["error"] ?? TempData["error"])%>
    <%=Html.Encode(ViewData["message"] ?? TempData["message"]) %>
</div>
