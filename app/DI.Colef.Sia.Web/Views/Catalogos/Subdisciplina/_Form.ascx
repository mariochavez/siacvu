<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<SubdisciplinaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Nombre</label>
    <%=Html.TextBox("Nombre", Model.Nombre, new { @class = "input250-requerido", maxlength = 40 })%>
    <span>(Debe de ser un nombre &uacute;nico)</span>
    <%=Html.ValidationMessage("Nombre") %>
</p>
<p>
    <label>Codigo Conacyt</label>
    <%=Html.TextBox("CodigoConacyt", Model.CodigoConacyt, new { @class = "input420-requerido", maxlength = 40 })%>
    <%=Html.ValidationMessage("CodigoConacyt")%>
</p>
<p>
    <label>Disciplina</label>
    <%=Html.DropDownList("Disciplina", Model.Disciplinas.CreateSelectList<DisciplinaForm>("Id", "Nombre"),
                "Seleccione ...")%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Disciplina")%>
</p>
