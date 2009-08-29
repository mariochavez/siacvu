<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ExperienciaProfesionalForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
	<label>&Aacute;rea</label>
	<%=Html.DropDownList("Area", Model.Areas.CreateSelectList<AreaForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<%=Html.ValidationMessage("Area") %>
</p>
<p>
	<label>Disciplina</label>
	<%=Html.DropDownList("Disciplina", Model.Disciplinas.CreateSelectList<DisciplinaForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<%=Html.ValidationMessage("Disciplina") %>
</p>
<p>
	<label>Subdisciplina</label>
	<%=Html.DropDownList("Subdisciplina", Model.Subdisciplinas.CreateSelectList<SubdisciplinaForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<%=Html.ValidationMessage("Subdisciplina") %>
</p>