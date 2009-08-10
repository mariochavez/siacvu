<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ReporteForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
        <td class="label">
			<label>Institucion:</label>
			<br />
			<%=Html.DropDownList("Institucion", Model.Instituciones.CreateSelectList<InstitucionForm>("Id", "Nombre"),
					"Seleccione ...")%>
			<%=Html.ValidationMessage("Institucion") %>
        </td>
        <td class="label">
			<label>Editorial:</label>
			<br />
			<%=Html.TextBox("Editorial", Model.Editorial, new { maxlength = 100 })%>
			<%=Html.ValidationMessage("Editorial")%>
        </td>
    </tr>
    <tr>
        <td class="label">
			<label>Pais:</label>
			<br />
			<%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
					"Seleccione ...")%>
			<%=Html.ValidationMessage("Pais") %>									
        </td>
        <td class="label">
			<label>No Paginas:</label>
			<br />
            <%=Html.TextBox("NoPaginas", Model.NoPaginas, new { maxlength = 10, size = 14 })%>
            <%=Html.ValidationMessage("NoPaginas")%>
        </td>
    </tr>
    <tr>
        <td class="label" colspan="2">
			<label>Descripcion:</label>
			<br />
			<%=Html.TextBox("Descripcion", Model.Descripcion, new { maxlength = 100 })%>
			<%=Html.ValidationMessage("Descripcion")%>
        </td>
    </tr>
</table>
