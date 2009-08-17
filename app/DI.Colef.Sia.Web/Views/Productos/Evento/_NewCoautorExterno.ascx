<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Coautor Externo</label>
    <%=Html.DropDownList("CoautorExternoEvento.InvestigadorExternoId", Model.CoautoresExternos.CreateSelectList<InvestigadorExternoForm>("Id", "Nombre"),
        "Seleccione ...")%>
    <%=Html.ValidationMessage("CoautorExternoEvento.InvestigadorExternoId")%>
</p>