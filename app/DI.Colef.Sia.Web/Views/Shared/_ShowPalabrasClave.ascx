<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<% if(!Model.IsShowForm){ %>
    <p>
        <label>Palabra clave 1</label>
        <%=Html.TextBox("PalabraClave1", Model.PalabraClave1, new { @class = "input250", maxlength = 50 })%>
        <span class="cvu"></span>
    </p>
    <p>
        <label>Palabra clave 2</label>
        <%=Html.TextBox("PalabraClave2", Model.PalabraClave2, new { @class = "input250", maxlength = 50 })%>
        <span class="cvu"></span>
    </p>
    <p>
        <label>Palabra clave 3</label>
        <%=Html.TextBox("PalabraClave3", Model.PalabraClave3, new { @class = "input250", maxlength = 50 })%>
        <span class="cvu"></span>
    </p>
<% } else { %>
    <p>
        <label>Palabra clave 1</label>
        <span class="valor"><%= Html.Encode(Model.PalabraClave1)%>&nbsp;</span>
    </p>
    <p>
        <label>Palabra clave 2</label>
        <span class="valor"><%= Html.Encode(Model.PalabraClave2)%>&nbsp;</span>
    </p>
    <p>
        <label>Palabra clave 3</label>
        <span class="valor"><%= Html.Encode(Model.PalabraClave3)%>&nbsp;</span>
    </p>
<% } %>