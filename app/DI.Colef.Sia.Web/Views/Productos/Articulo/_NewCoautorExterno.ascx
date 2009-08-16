﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ArticuloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Coautor Externo</label>

    <%=Html.DropDownList("CoautorExternoArticulo.InvestigadorExternoId", Model.CoautoresExternos.CreateSelectList<InvestigadorExternoForm>("Id", "Nombre"),
        "Seleccione ...")%>
    <%=Html.ValidationMessage("CoautorExternoArticulo.InvestigadorExternoId")%>
</p>