<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ArticuloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Coautor interno</label>
    
    <%=Html.DropDownList("CoautorInternoProducto.InvestigadorId", Model.CoautoresInternos.CreateSelectList<InvestigadorForm>("Id", "NombreCoautor"),
                "Seleccione ...", new { rel = "#coautorinterno", @class = "requerido" })%>
    <%=Html.ValidationMessage("CoautorInternoProducto.InvestigadorId")%>
</p>