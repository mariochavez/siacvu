<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Tipo de participaci&oacute;n</label>
    <%=Html.DropDownList("TipoParticipacion", Model.TiposParticipaciones.CreateSelectList<TipoParticipacionForm>("Id", "Nombre"),
				"Seleccione ...")%>
	<span class="cvu"></span>
</p>
<p>
    <label>Tipo de participante</label>
    <%=Html.DropDownList("TipoParticipante", Model.TiposParticipantes.CreateSelectList<TipoParticipanteForm>("Id", "Nombre"),
				"Seleccione ...")%>
    <span class="cvu"></span>
</p>
<p id="traductor_field">
    <label>Traductor/Co-Traductor</label>
    <%=Html.CheckBox("Traductor", Model.Traductor)%>
    <span class="cvu"></span>
</p>