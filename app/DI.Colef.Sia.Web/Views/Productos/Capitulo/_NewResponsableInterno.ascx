<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Responsable Interno</label>
   
    <%=Html.DropDownList("ResponsableInternoCapitulo.InvestigadorId", Model.ResponsablesInternos.CreateSelectList<InvestigadorForm>("Id", "Nombre"),
        "Seleccione ...")%>
	<%=Html.ValidationMessage("ResponsableInternoCapitulo.InvestigadorId") %>
</p>