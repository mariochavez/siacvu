<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<FormacionAcademicaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
        <td class="label">
            <label>Estatus:</label>
            <br />
            <%=Html.TextBox("Estatus", Model.Estatus, new { maxlength = 100 })%>
            <%=Html.ValidationMessage("Estatus")%>
        </td>
        <td class="label">
                <label>Sector:</label>
                <br />
                <%=Html.DropDownList("Sector", Model.Sectores.CreateSelectList<SectorForm>("Id", "Nombre"),
                    "Seleccione ...")%>
                <%=Html.ValidationMessage("Sector") %>
        </td>
    </tr>
    <tr>
        <td class="label">
            <label>Organizacion:</label>
            <br />
            <%=Html.DropDownList("Organizacion", Model.Organizaciones.CreateSelectList<OrganizacionForm>("Id", "Nombre"),
                "Seleccione ...")%>
            <%=Html.ValidationMessage("Organizacion") %>
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