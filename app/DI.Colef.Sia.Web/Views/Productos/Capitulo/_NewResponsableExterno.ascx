<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Responsables Externos:</label>
    
    <%=Html.DropDownList("ResponsableExternoCapitulo.InvestigadorExternoId", Model.ResponsablesExternos.CreateSelectList<InvestigadorExternoForm>("Id", "Nombre"),
        "Seleccione ...")%>
	<%=Html.ValidationMessage("ResponsableExternoCapitulo.InvestigadorExternoId") %>
</p>