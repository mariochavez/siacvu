<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl" %>
<div id="mensaje-error" class="<% if((ViewData["message"] ?? TempData["message"])!= null) { %>
        mensaje-acierto
    <% } else if((ViewData["error"] ?? TempData["error"]) != null) { %>
        mensaje-error
    <% } %>">
    <p>
        <%=Html.Encode(ViewData["error"] ?? TempData["error"])%>
        <%=Html.Encode(ViewData["message"] ?? TempData["message"]) %>
    </p>
</div>
