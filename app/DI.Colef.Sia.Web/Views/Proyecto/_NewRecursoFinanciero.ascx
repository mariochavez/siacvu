<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Instituci&oacute;n financiadora</label>
    <%=Html.TextBox("RecursoFinanciero.Institucion", "",
            new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "Institucion"), maxlength = 100 })%>
    <%=Html.Hidden("RecursoFinanciero.InstitucionId", 0, new { rel = "#RecursoFinanciero_Institucion" })%>
</p>
<p>
    <label>Monto</label>
	<%=Html.TextBox("RecursoFinanciero.Monto", 0, new { @class = "input250-requerido" })%>
	<%=Html.ValidationMessage("RecursoFinanciero.Monto")%>
</p>
<p>
    <label>Moneda</label>
	<%=Html.DropDownList("RecursoFinanciero.Moneda", Model.Monedas.CreateSelectList<MonedaForm>("Id", "Nombre"),
                    "Seleccione ...", new { @class = "requerido" })%>
	<%=Html.ValidationMessage("RecursoFinanciero.Moneda")%>
</p>