<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers" %>
<h1>
    <%--<%=Html.Encode(Page.User.Identity.Name) %>--%>
    <%= Html.Encode(Session["nombreCompleto"])%>
</h1>
<h3><%=Html.SievaPuntos()%></h3>
<ul id="menu">
    <li><%=Html.ActionLinkForAreas<HomeController>(x => x.Index(), "Inicio") %> | </li>
    <li><%=Html.ActionLinkForAreas<InvestigadorController>(x => x.Perfil(), "Perfil") %> | </li>
	<li><%=Html.ActionLinkForAreas<HomeController>(x => x.Bandeja(), "Bandeja de pendientes") %> | </li>
    <li><%=Html.ActionLink("Cerrar Sesión", "Destroy", "Session")%></li>	
</ul>