<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<h1><%=Html.Encode(Page.User.Identity.Name) %></h1>
<ul id="menu">
    <li><%=Html.ActionLinkForAreas<HomeController>(x => x.Index(), "Inicio") %> | </li>
    <li><%=Html.ActionLinkForAreas<InvestigadorController>(x => x.Perfil(), "Perfil") %> | </li>
	<li><%=Html.ActionLinkForAreas<HomeController>(x => x.Bandeja(), "Bandeja de pendientes") %> | </li>
    <li><%=Html.ActionLink("Cerrar Sesión", "Destroy", "Session")%></li>	
</ul>