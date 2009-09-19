<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista">
    <h5>&Aacute;rea del conocimiento</h5>
</div>
<p>
	<label>&Aacute;rea</label>
	<%=Html.DropDownList("Area", Model.Areas.CreateSelectList<AreaForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "cascade", rel = Url.Action("ChangeArea") })%>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("Area") %>
</p>
<p>
	<label>Disciplina</label>
	<%=Html.DropDownList("Disciplina", Model.Disciplinas.CreateSelectList<DisciplinaForm>("Id", "Nombre"),
		"Seleccione ...", new { @class = "cascade", rel = Url.Action("ChangeDisciplina") })%>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("Disciplina") %>
</p>
<p>
	<label>Subdisciplina</label>
	<%=Html.DropDownList("Subdisciplina", Model.Subdisciplinas.CreateSelectList<SubdisciplinaForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("Subdisciplina") %>
</p>