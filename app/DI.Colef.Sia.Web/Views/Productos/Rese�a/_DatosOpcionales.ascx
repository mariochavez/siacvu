<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ReseñaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
        <td class="label">
            <label>Palabras Claves:</label>
            <br />
            <%=Html.TextBox("PalabrasClave", Model.PalabrasClave, new { maxlength = 100 })%>
            <%=Html.ValidationMessage("PalabrasClave")%>
        </td>
        <td class="label">
            <label>Area:</label>
            <br />
            <%=Html.DropDownList("Area", Model.Areas.CreateSelectList<AreaForm>("Id", "Nombre"),
                "Seleccione ...")%>
            <%=Html.ValidationMessage("Area") %>
        </td>
    </tr>
    <tr>
        <td class="label">
            <label>Disciplina:</label>
            <br />
            <%=Html.DropDownList("Disciplina", Model.Disciplinas.CreateSelectList<DisciplinaForm>("Id", "Nombre"),
                "Seleccione ...")%>
            <%=Html.ValidationMessage("Disciplina") %>
        </td>
        <td class="label">
            <label>Subdisciplina:</label>
            <br />
            <%=Html.DropDownList("Subdisciplina", Model.Subdisciplinas.CreateSelectList<SubdisciplinaForm>("Id", "Nombre"),
                "Seleccione ...")%>
            <%=Html.ValidationMessage("Subdisciplina") %>
        </td>
    </tr>
</table>