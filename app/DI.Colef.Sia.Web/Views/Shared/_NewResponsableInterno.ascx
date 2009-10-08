<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResponsableForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Responsable interno</label>
    <%=Html.TextBox("ResponsableInterno.Nombre", "",
        new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "Investigador"), maxlength = 100 })%>
    <%=Html.Hidden("ResponsableInterno.InvestigadorId", 0, new { rel = "#ResponsableInterno_Nombre" })%>
</p>

<p>
    <label>Posici&oacute;n responsable interno</label>
    <%=Html.TextBox("ResponsableInterno.Posicion", 2, new { @class = "input100", maxlength = 3 })%>
</p>