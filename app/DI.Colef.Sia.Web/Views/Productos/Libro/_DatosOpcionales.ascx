<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<LibroForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<table class="subform">
    <tr>
        <td>
            <label>
                Identificador Libro:</label>
        </td>
        <td>
            <%=Html.DropDownList("IdentificadorLibro", Model.IdentificadoresLibros.CreateSelectList<IdentificadorLibroForm>("Id", "Nombre"),
								"Seleccione ...")%>
            <%=Html.ValidationMessage("IdentificadorLibro") %>
        </td>
    </tr>
    <tr>
        <td>
            <label>
                Palabras Clave:</label>
        </td>
        <td>
            <%=Html.TextBox("PalabrasClave", Model.PalabrasClave, new { maxlength = 100 })%>
            <%=Html.ValidationMessage("PalabrasClave")%>
        </td>
    </tr>
    <tr>
        <td>
            <label>
                Co Traductor:</label>
        </td>
        <td>
            <%=Html.TextBox("CoTraductor", Model.CoTraductor, new { maxlength = 100 })%>
            <%=Html.ValidationMessage("CoTraductor")%>
        </td>
    </tr>
    <tr>
        <td>
            <label>
                Traductor:</label>
        </td>
        <td>
            <%=Html.TextBox("Traductor", Model.Traductor, new { maxlength = 100 })%>
            <%=Html.ValidationMessage("Traductor")%>
        </td>
    </tr>
    <tr>
        <td>
            <label>
                Area:</label>
        </td>
        <td>
            <%=Html.DropDownList("Area", Model.Areas.CreateSelectList<AreaForm>("Id", "Nombre"),
								"Seleccione ...")%>
            <%=Html.ValidationMessage("Area") %>
        </td>
    </tr>
    <tr>
        <td>
            <label>
                Disciplina:</label>
        </td>
        <td>
            <%=Html.DropDownList("Disciplina", Model.Disciplinas.CreateSelectList<DisciplinaForm>("Id", "Nombre"),
								"Seleccione ...")%>
            <%=Html.ValidationMessage("Disciplina") %>
        </td>
    </tr>
    <tr>
        <td>
            <label>
                Subdisciplina:</label>
        </td>
        <td>
            <%=Html.DropDownList("Subdisciplina", Model.Subdisciplinas.CreateSelectList<SubdisciplinaForm>("Id", "Nombre"),
								"Seleccione ...")%>
            <%=Html.ValidationMessage("Subdisciplina") %>
        </td>
    </tr>
</table>
