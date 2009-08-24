<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Responsable externo</label>
    
    <%=Html.DropDownList("ResponsableExternoCapitulo.InvestigadorExternoId", Model.ResponsablesExternos.CreateSelectList<InvestigadorExternoForm>("Id", "Nombre"),
        "Seleccione ...", new { rel = "#responsableexterno" })%>
	<%=Html.ValidationMessage("ResponsableExternoCapitulo.InvestigadorExternoId") %>
</p>