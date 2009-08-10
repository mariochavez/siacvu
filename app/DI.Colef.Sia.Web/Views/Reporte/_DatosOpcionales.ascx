<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ReporteForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
        <td class="label">
			<label>Objetivo:</label>
			<br />
			<%=Html.TextBox("Objetivo", Model.Objetivo, new { maxlength = 100 })%>
			<%=Html.ValidationMessage("Objetivo")%>
        </td>
        <td class="label">
			<label>Palabaras Clave:</label>
			<br />
			<%=Html.TextBox("PalabarasClave", Model.PalabarasClave, new { maxlength = 100 })%>
			<%=Html.ValidationMessage("PalabarasClave")%>
        </td>
    </tr>
    <tr>
        <td class="label" colspan="2">
			<label>Fecha:</label>
			<br />
			<%=Html.TextBox("Fecha", Model.Fecha, new { @class="datetime", maxlength = 10 })%>
			<span class="helper_message">(Formato dd/mm/yyyy)</span>
			<%=Html.ValidationMessage("Fecha")%>
        </td>
    </tr>
</table>