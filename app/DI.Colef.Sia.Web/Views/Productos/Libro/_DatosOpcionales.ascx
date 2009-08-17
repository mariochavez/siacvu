<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<LibroForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Identificador Libro</label>
    <%=Html.DropDownList("IdentificadorLibro", Model.IdentificadoresLibros.CreateSelectList<IdentificadorLibroForm>("Id", "Nombre"),
								"Seleccione ...")%>
    <%=Html.ValidationMessage("IdentificadorLibro") %>
</p>
<p>
    <label>Palabras Clave</label>
    <%=Html.TextBox("PalabrasClave", Model.PalabrasClave, new { @class = "input250", maxlength = 100 })%>
    <%=Html.ValidationMessage("PalabrasClave")%>
</p>
<p>
    <label>Cotraductor</label>
    <%=Html.TextBox("CoTraductor", Model.CoTraductor, new { @class = "input250", maxlength = 100 })%>
    <%=Html.ValidationMessage("CoTraductor")%>
</p>
<p>
    <label>Traductor</label>
    <%=Html.TextBox("Traductor", Model.Traductor, new { @class = "input250", maxlength = 100 })%>
    <%=Html.ValidationMessage("Traductor")%>
</p>
<p>
    <label>Area</label>
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
