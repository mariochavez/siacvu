<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl" %>
<div id="message" class="<% if(TempData.ContainsKey("message")) { %>message<% } else if(ViewData.ContainsKey("error")) { %>errormessage<% } %>">
    <% if (TempData.ContainsKey("message")) { %>
            <%=Html.Encode(TempData["message"]) %>
    <% } else if (ViewData.ContainsKey("error")) { %>
           <%=Html.Encode(ViewData["error"])%>
    <% } %>
</div>
