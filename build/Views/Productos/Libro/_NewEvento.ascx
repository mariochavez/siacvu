<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<LibroForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Nombre del evento</label>
    <%=Html.TextBox("Evento.Nombre", Model.Evento.Nombre, new { @class = "input250-requerido", maxlength = 40 })%>
    <%=Html.Hidden("Evento.Id", Model.Evento.Id)%>
    <%=Html.ValidationMessage("Evento.Nombre")%>
</p>
<p>
    <label>Fecha del evento</label>
	<%=Html.TextBox("Evento.FechaEvento", Model.Evento.FechaEvento, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("Evento.FechaEvento")%>
</p>