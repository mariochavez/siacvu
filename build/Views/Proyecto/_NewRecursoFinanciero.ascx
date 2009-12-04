<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Instituci&oacute;n</label>

	<%=Html.DropDownList("RecursoFinancieroProyecto.IntitucionId", Model.Instituciones.CreateSelectList<InstitucionForm>("Id", "Nombre"),
            "Seleccione ...", new { rel = "#recursofinanciero", @class = "requerido" })%>
	<%=Html.ValidationMessage("RecursoFinancieroProyecto.InstitucionId") %>
</p>
<p>
    <label>Recurso</label>

	<%=Html.TextBox("RecursoFinancieroProyecto.Recurso", Model.RecursoFinancieroProyecto.Recurso, new { rel = "#recursofinanciero", @class = "input250-requerido" })%>
	<%=Html.ValidationMessage("RecursoFinancieroProyecto.Recurso")%>
</p>
<p>
    <label>Monto</label>

	<%=Html.TextBox("RecursoFinancieroProyecto.Monto", Model.RecursoFinancieroProyecto.Monto, new { rel = "#recursofinanciero", @class = "input250-requerido" })%>
	<%=Html.ValidationMessage("RecursoFinancieroProyecto.Monto")%>
</p>
<p>
    <label>Moneda</label>

	<%=Html.DropDownList("RecursoFinancieroProyecto.MonedaId", Model.Monedas.CreateSelectList<MonedaForm>("Id", "Nombre"),
                    "Seleccione ...", new { rel = "#recursofinanciero", @class = "requerido" })%>
	<%=Html.ValidationMessage("RecursoFinancieroProyecto.MonedaId")%>
</p>