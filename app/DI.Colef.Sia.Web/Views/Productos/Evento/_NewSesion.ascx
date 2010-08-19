<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Nombre de la sesi&oacute;n</label>
    <%=Html.TextBox("Sesion.NombreSesion", Model.SesionEvento.NombreSesion, new { @class = "input420-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("Sesion.NombreSesion")%>
</p>
<p>
    <label>Objetivo de la sesi&oacute;n</label>
    <%=Html.TextArea("Sesion.ObjetivoSesion", Model.SesionEvento.ObjetivoSesion, 3, 35, new { @class = "input420", maxlength = 300 })%>
	<%=Html.ValidationMessage("Sesion.ObjetivoSesion")%>
</p>
<p>
    <label>&Aacute;mbito</label>
    <%=Html.DropDownList("Sesion.Ambito", Model.Ambitos.CreateSelectList<AmbitoForm>("Id", "Nombre"),
        "Seleccione ...")%>
    <%=Html.ValidationMessage("Sesion.Ambito")%>
</p>
<p>
    <label>Fecha del evento</label>
    <%=Html.TextBox("Sesion.FechaEvento", Model.SesionEvento.FechaEvento, new { @class = "datetime input100", maxlength = 10 })%>
    <span>(Formato dd/mm/aaaa)</span>
	<%=Html.ValidationMessage("Sesion.FechaEvento")%>
</p>
<p>
    <label>Lugar (Ciudad/Estado)</label>
    <%=Html.TextBox("Sesion.Lugar", Model.SesionEvento.Lugar, new { @class = "input420", maxlength = 100 })%>
	<%=Html.ValidationMessage("Sesion.Lugar")%>
</p>

<h4>Logros de la sesi&oacute;n</h4>
<%--    <% Html.RenderPartial("_EditParticipanteInterno", new ParticipanteForm { ParticipantesInternos = Model.SesionEvento.ParticipanteInternoEventos, ModelId = Model.SesionEvento.Id }); %>
    <% Html.RenderPartial("_EditParticipanteExterno", new ParticipanteForm { ParticipantesExternos = Model.SesionEvento.ParticipanteExternoEventos, ModelId = Model.SesionEvento.Id }); %>--%>
<p>
    <label>Principales logros de la sesi&oacute;n</label>
    <%=Html.TextArea("Sesion.Logros", Model.SesionEvento.Logros, 3, 35, new { @class = "input420", maxlength = 300 })%>
	<%=Html.ValidationMessage("Sesion.Logros")%>
</p>
<p>
    <label>N&uacute;mero de participantes</label>
    <span id="totalparticipantes" class="valor"><%=Html.Encode(Model.SesionEvento.TotalParticipantes)%></span>
</p>