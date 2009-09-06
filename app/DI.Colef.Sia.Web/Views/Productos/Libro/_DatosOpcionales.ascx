<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<LibroForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Identificador del libro</label>
    <%=Html.DropDownList("IdentificadorLibro", Model.IdentificadoresLibros.CreateSelectList<IdentificadorLibroForm>("Id", "Nombre"),
								"Seleccione ...")%>
	<span class="cvu"></span>
    <%=Html.ValidationMessage("IdentificadorLibro") %>
</p>
<p>
	<label>Palabra clave 1</label>
	<%=Html.TextBox("PalabraClave1", Model.PalabraClave1, new { @class = "input250", maxlength = 100 })%>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("PalabraClave1")%>
</p>
<p>
	<label>Palabra clave 2</label>
	<%=Html.TextBox("PalabraClave2", Model.PalabraClave2, new { @class = "input250", maxlength = 100 })%>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("PalabraClave2")%>
</p>
<p>
	<label>Palabra clave 3</label>
    <%=Html.TextBox("PalabraClave3", Model.PalabraClave3, new { @class = "input250", maxlength = 100 })%>
    <span class="cvu"></span>
	<%=Html.ValidationMessage("PalabraClave3")%>
</p>
<p class="traductor_field">
    <label>Traductor/Co-Traductor</label>
    <%= Html.TextBox("CoTraductor", Model.CoTraductor, new { @class = "input250", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("CoTraductor")%>
</p>
<p class="traductor_field">
    <label>Nombre del traductor</label>
    <%= Html.TextBox("NombreTraductor", Model.NombreTraductor, new { @class = "input250", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("NombreTraductor")%>
</p>
<p>
    <label>&Aacute;rea</label>
    <%=Html.DropDownList("Area", Model.Areas.CreateSelectList<AreaForm>("Id", "Nombre"),
								"Seleccione ...")%>
	<span class="cvu"></span>
    <%=Html.ValidationMessage("Area") %>
</p>
<p>
    <label>Disciplina</label>
    <%=Html.DropDownList("Disciplina", Model.Disciplinas.CreateSelectList<DisciplinaForm>("Id", "Nombre"),
								"Seleccione ...")%>
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