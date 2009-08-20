<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Tipo de Evento</label>
	<%=Html.DropDownList("TipoEvento", Model.TiposEventos.CreateSelectList<TipoEventoForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
	<%=Html.ValidationMessage("TipoEvento") %>
</p>
<p>
    <label>Nombre del Evento</label>
	<%=Html.TextBox("Nombre", Model.Nombre, new { @class = "input250-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("Nombre")%>
</p>
<p>
    <label>Con Invitaci&oacute;n</label>
    <%= Html.CheckBox("Invitacion", Model.Invitacion) %>
    <%=Html.ValidationMessage("Invitacion")%>
</p>
<p>
    <label>&Aacute;mbito</label>
	<%=Html.DropDownList("Ambito", Model.Ambitos.CreateSelectList<AmbitoForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
	<%=Html.ValidationMessage("Ambito") %>
</p>
<p>
    <label>T&iacute;tulo del Trabajo</label>
	<%=Html.TextBox("Titulo", Model.Titulo, new { @class = "input250-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("Titulo")%>
</p>