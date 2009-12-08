<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Nombre de la sesi&oacute;n</label>
    <%=Html.TextBox("SesionEvento.NombreSesion", Model.SesionEvento.NombreSesion, new { @class = "input420-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("SesionEvento.NombreSesion")%>
</p>
<p>
    <label>Objetivo de la sesi&oacute;n</label>
    <%=Html.TextBox("SesionEvento.ObjetivoSesion", Model.SesionEvento.ObjetivoSesion, new { @class = "input420-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("SesionEvento.ObjetivoSesion")%>
</p>
<p>
    <label>&Aacute;mbito</label>
    <%=Html.DropDownList("SesionEvento.Ambito", Model.Ambitos.CreateSelectList<AmbitoForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido"})%>
    <%=Html.ValidationMessage("SesionEvento.Ambito")%>
</p>
<p>
    <label>Fecha del evento</label>
    <%=Html.TextBox("SesionEvento.FechaEvento", Model.SesionEvento.FechaEvento, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
	<%=Html.ValidationMessage("SesionEvento.FechaEvento")%>
</p>
<p>
    <label>Lugar (Ciudad/Estado)</label>
    <%=Html.TextBox("SesionEvento.Lugar", Model.SesionEvento.Lugar, new { @class = "input420-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("SesionEvento.Lugar")%>
</p>