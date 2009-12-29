<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<div id="usuario">
    <p><span class="usuario"><%=Html.Encode(Page.User.Identity.Name) %></span> /  
        <%=Html.ActionLinkForAreas<InvestigadorController>(x => x.Perfil(), "Perfil") %> / 
        <%=Html.ActionLink("Cerrar Sesión", "Destroy", "Session")%>
    </p>
</div><!--end usuario-->