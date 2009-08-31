<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl" %>
<div id="usuario">
    <p><span class="usuario"><%=Html.Encode(Page.User.Identity.Name) %></span> / <a title="Perfil" href="#">Perfil</a> / <%=Html.ActionLink("Cerrar Sesión", "Destroy", "Session")%></p>
</div><!--end usuario-->