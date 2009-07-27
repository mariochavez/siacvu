<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl" %>
<div id="message" class="<% if(TempData["message"] != null) { %>message<% } else if(TempData["error"] != null) { %>errormessage<% } %>">
    <% if (TempData.ContainsKey("message")) { %>
            <%=Html.Encode(TempData["message"]) %>
    <% } else if (TempData.ContainsKey("error")) { %>
           <%=Html.Encode(TempData["error"]) %>
    <% } %>
</div>
