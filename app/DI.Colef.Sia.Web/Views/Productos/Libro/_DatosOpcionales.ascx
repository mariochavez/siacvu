<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<LibroForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Identificador del libro</label>
    <%=Html.DropDownList("IdentificadorLibro", Model.IdentificadoresLibros.CreateSelectList<IdentificadorLibroForm>("Id", "Nombre"),
								"Seleccione ...")%>
    <%=Html.ValidationMessage("IdentificadorLibro") %>
</p>
<p>
	<label>Palabra clave 1</label>
	<%=Html.TextBox("PalabraClave1", Model.PalabraClave1, new { @class = "input250", maxlength = 100 })%>
	<%=Html.ValidationMessage("PalabraClave1")%>
</p>
<p>
	<label>Palabra clave 2</label>
	<%=Html.TextBox("PalabraClave2", Model.PalabraClave2, new { @class = "input250", maxlength = 100 })%>
	<%=Html.ValidationMessage("PalabraClave2")%>
</p>
<p>
	<label>Palabra clave 3</label>
    <%=Html.TextBox("PalabraClave3", Model.PalabraClave3, new { @class = "input250", maxlength = 100 })%>
	<%=Html.ValidationMessage("PalabraClave3")%>
</p>
<p>
    <label>Traductor/Co-Traductor</label>
    <%= Html.CheckBox("Traductor", Model.Traductor)%>
    <%=Html.ValidationMessage("Traductor")%>
</p>
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