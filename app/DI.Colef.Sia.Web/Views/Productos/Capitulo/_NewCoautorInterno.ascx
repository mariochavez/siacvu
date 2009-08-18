<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Coautor Interno</label>
    
    <%=Html.DropDownList("CoautorInternoCapitulo.InvestigadorId", Model.CoautoresInternos.CreateSelectList<InvestigadorForm>("Id", "Nombre"),
            "Seleccione ...", new { rel = "#coautorinterno" })%>
    <%=Html.ValidationMessage("CoautorInternoCapitulo.InvestigadorId")%>
</p>