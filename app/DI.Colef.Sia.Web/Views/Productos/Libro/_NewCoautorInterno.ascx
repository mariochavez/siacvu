<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<LibroForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Coautor interno</label>
	<%=Html.DropDownList("CoautorInternoLibro.InvestigadorId", Model.CoautoresInternos.CreateSelectList<InvestigadorForm>("Id", "NombreCoautor"),
            "Seleccione ...", new { rel = "#coautorinterno" })%>
	<%=Html.ValidationMessage("CoautorInternoLibro.InvestigadorId")%>
</p>
