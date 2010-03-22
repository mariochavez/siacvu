<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<GlosarioForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<p>
    <label>Nombre del Campo</label>
    <%=Html.TextBox("Campo", Model.Campo, new {@class = "input420-bold-requerido", maxlenght = 40}) %>
    <%=Html.ValidationMessage("Campo") %>
</p>

<p>
    <label>Descripcion</label>
    <%=Html.TextBox("Descripcion", Model.Descripcion, new { @class = "input420-bold-requerido", maxlenght = 40 })%>
    <%=Html.ValidationMessage("Descripcion") %>
</p>

<p>
    <label>Contexto</label>
    <%=Html.TextBox("Contexto", Model.Contexto, new { @class = "input420-bold-requerido", maxlenght = 40 })%>
    <%=Html.ValidationMessage("Contexto")%>
</p>