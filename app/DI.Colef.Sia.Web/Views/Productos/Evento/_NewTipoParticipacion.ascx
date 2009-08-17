<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Tipo Participaci&oacute;n</label>
    <%=Html.DropDownList("TipoParticipacionEvento.TipoParticipacion", Model.TiposParticipaciones.CreateSelectList<TipoParticipacionForm>("Id", "Nombre"),
        "Seleccione ...")%>
    <%=Html.ValidationMessage("TipoParticipacionEvento.TipoParticipacion") %>
</p>