<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Responsable interno</label>
   
    <%=Html.DropDownList("ResponsableInternoCapitulo.InvestigadorId", Model.ResponsablesInternos.CreateSelectList<InvestigadorForm>("Id", "NombreCoautor"),
        "Seleccione ...", new { rel = "#responsableinterno" })%>
	<%=Html.ValidationMessage("ResponsableInternoCapitulo.InvestigadorId") %>
</p>