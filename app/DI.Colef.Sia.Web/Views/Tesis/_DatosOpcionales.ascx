<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<TesisForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
        <td class="label">
		    <label>Sector:</label>
		    <br />
		    <%=Html.DropDownList("Sector", Model.Sectores.CreateSelectList<SectorForm>("Id", "Nombre"),
				    "Seleccione ...")%>
		    <%=Html.ValidationMessage("Sector") %>
        </td>
        <td class="label">
		    <label>Dependencia:</label>
		    <br />
		    <%=Html.DropDownList("Dependencia", Model.Dependencias.CreateSelectList<DependenciaForm>("Id", "Nombre"),
				    "Seleccione ...")%>
		    <%=Html.ValidationMessage("Dependencia") %>
        </td>
    </tr>
    <tr>
        <td class="label">
	        <label>Departamento:</label>
	        <br />
	        <%=Html.DropDownList("Departamento", Model.Departamentos.CreateSelectList<DepartamentoForm>("Id", "Nombre"),
			        "Seleccione ...")%>
	        <%=Html.ValidationMessage("Departamento") %>
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