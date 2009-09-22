<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<LibroForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Identificador del libro</label>
    <%=Html.DropDownList("IdentificadorLibro", Model.IdentificadoresLibros.CreateSelectList<IdentificadorLibroForm>("Id", "Nombre"),
								"Seleccione ...")%>
	<span class="cvu"></span>    
</p>
<p>
	<label>Palabra clave 1</label>
	<%=Html.TextBox("PalabraClave1", Model.PalabraClave1, new { @class = "input250", maxlength = 100 })%>
	<span class="cvu"></span>
</p>
<p>
	<label>Palabra clave 2</label>
	<%=Html.TextBox("PalabraClave2", Model.PalabraClave2, new { @class = "input250", maxlength = 100 })%>
	<span class="cvu"></span>
</p>
<p>
	<label>Palabra clave 3</label>
    <%=Html.TextBox("PalabraClave3", Model.PalabraClave3, new { @class = "input250", maxlength = 100 })%>
    <span class="cvu"></span>
</p>
<p class="traductor_field">
    <label>Traductor/Co-Traductor</label>
    <%= Html.CheckBox("Traductor", Model.Traductor)%>
    <span class="cvu"></span>
</p>
<p class="NombreTraductor">
    <label>Nombre del traductor</label>
    <%= Html.TextBox("NombreTraductor", Model.NombreTraductor, new { @class = "input250", maxlength = 100 })%>
    <span class="cvu"></span>
</p>
<p>
    <label>&Aacute;rea</label>
    <%=Html.DropDownList("Area", Model.Areas.CreateSelectList<AreaForm>("Id", "Nombre"),
								"Seleccione ...", new { @class = "cascade", rel = Url.Action("ChangeArea")} )%>
	<span class="cvu"></span>
</p>
<p>
    <label>Disciplina</label>
    <%=Html.DropDownList("Disciplina", Model.Disciplinas.CreateSelectList<DisciplinaForm>("Id", "Nombre"),
                        "Seleccione ...", new { @class = "cascade", rel = Url.Action("ChangeDisciplina") })%>
    <span class="cvu"></span>
</p>
<p>
    <label>Subdisciplina</label>
    <%=Html.DropDownList("Subdisciplina", Model.Subdisciplinas.CreateSelectList<SubdisciplinaForm>("Id", "Nombre"),
								"Seleccione ...")%>
	<span class="cvu"></span>
</p>