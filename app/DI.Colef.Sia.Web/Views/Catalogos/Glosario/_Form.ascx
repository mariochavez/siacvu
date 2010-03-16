<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<GlosarioForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<p>
    <label>Nombre del Campo</label>
    <%=Html.TextArea("Campo", Model.Campo, new {@class = "input250-requerido", maxlenght = 40}) %>
    <span>(Se debe ingresar un nombre)</span>
    <%=Html.ValidationMessage("Campo") %>
</p>

<p>
    <label>Nombre de la Descripcion</label>
    <%=Html.TextArea("Descripcion", Model.Descripcion, new {@class = "input250-requerido", maxlenght = 40}) %>
    <span>(Se debe ingresar un nombre)</span>
    <%=Html.ValidationMessage("Descripcion") %>
</p>

<p>
    <label>Nombre del Contexto</label>
    <%=Html.TextArea("Contexto", Model.Contexto, new { @class = "input250-requerido", maxlenght = 40 })%>
    <span>(Se debe ingresar un nombre)</span>
    <%=Html.ValidationMessage("Contexto")%>
</p>