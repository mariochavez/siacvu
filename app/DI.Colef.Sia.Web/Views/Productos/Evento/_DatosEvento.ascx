<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Tipo de evento</label>
	<%=Html.DropDownList("TipoEvento", Model.TiposEventos.CreateSelectList<TipoEventoForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
	<%=Html.ValidationMessage("TipoEvento") %>
</p>
<p>
    <label>Nombre del evento</label>
	<%=Html.TextBox("Nombre", Model.Nombre, new { @class = "input420-bold-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("Nombre")%>
</p>
<p>
    <label>Con invitaci&oacute;n</label>
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
    <label>T&iacute;tulo del trabajo</label>
	<%=Html.TextBox("Titulo", Model.Titulo, new { @class = "input250-requerido", maxlength = 100 })%>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("Titulo")%>
</p>