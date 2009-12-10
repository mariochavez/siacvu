<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Nombre de la sesi&oacute;n</label>
    <%=Html.TextBox("Sesion.NombreSesion", "", new { @class = "input420-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("Sesion.NombreSesion")%>
</p>
<p>
    <label>Objetivo de la sesi&oacute;n</label>
    <%=Html.TextArea("Sesion.ObjetivoSesion", "", 3, 35, new { @class = "input420-requerido", maxlength = 300 })%>
	<%=Html.ValidationMessage("Sesion.ObjetivoSesion")%>
</p>
<p>
    <label>&Aacute;mbito</label>
    <%=Html.DropDownList("Sesion.Ambito", Model.Ambitos.CreateSelectList<AmbitoForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido"})%>
    <%=Html.ValidationMessage("Sesion.Ambito")%>
</p>
<p>
    <label>Fecha del evento</label>
    <%=Html.TextBox("Sesion.FechaEvento", "", new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
	<%=Html.ValidationMessage("Sesion.FechaEvento")%>
</p>
<p>
    <label>Lugar (Ciudad/Estado)</label>
    <%=Html.TextBox("Sesion.Lugar", "", new { @class = "input420-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("Sesion.Lugar")%>
</p>

<h4>Participantes y logros de la sesi&oacute;n</h4>

<p>
    <label>Principales logros de la sesi&oacute;n</label>
    <%=Html.TextArea("Sesion.Logros", "", 3, 35, new { @class = "input420-requerido", maxlength = 300 })%>
	<%=Html.ValidationMessage("Sesion.Logros")%>
</p>
<%--<p>
    <label>N&uacute;mero de participantes</label>
    <span id="totalparticipantes" class="valor"><%=Html.Encode(Model.SesionEvento.TotalParticipantes)%></span>
    <span class="cvu"></span>	          
</p>--%>