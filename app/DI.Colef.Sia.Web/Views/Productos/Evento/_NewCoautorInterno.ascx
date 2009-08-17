<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Coautor Interno</label>
    <%=Html.DropDownList("CoautorInternoEvento.InvestigadorId", Model.CoautoresInternos.CreateSelectList<InvestigadorForm>("Id", "Nombre"),
        "Seleccione ...")%>
    <%=Html.ValidationMessage("CoautorInternoEvento.InvestigadorId")%>
</p>