<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Volumen</label>
    <%=Html.TextBox("Volumen", Model.Volumen, new { @class = "input250", maxlength = 100 })%>
    <%=Html.ValidationMessage("Volumen")%>
</p>
<p>
    <label>Editores</label>
    <%=Html.TextBox("Editores", Model.Editores, new { @class = "input250", maxlength = 100 })%>
    <%=Html.ValidationMessage("Editores")%>
</p>
<p>
    <label>Tipo de participaci&oacute;n</label>
    <%=Html.DropDownList("TipoParticipacion", Model.TiposParticipaciones.CreateSelectList<TipoParticipacionForm>("Id", "Nombre"),
				"Seleccione ...")%>
    <%=Html.ValidationMessage("TipoParticipacion") %>
</p>
<p>
    <label>Tipo de participante</label>
    <%=Html.DropDownList("TipoParticipante", Model.TiposParticipantes.CreateSelectList<TipoParticipanteForm>("Id", "Nombre"),
				"Seleccione ...")%>
    <%=Html.ValidationMessage("TipoParticipante") %>
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
<p>
    <label>Traductor/Co-Traductor</label>
    <%=Html.TextBox("Traductor", Model.Traductor, new { @class = "input250", maxlength = 100 })%>
    <%=Html.ValidationMessage("Traductor")%>
</p>
<p>
    <label>Nombre del traductor</label>
    <%=Html.TextBox("NombreTraductor", Model.NombreTraductor, new { @class = "input250", maxlength = 100 })%>
    <%=Html.ValidationMessage("NombreTraductor")%>
</p>
<p>
    <label>Resumen</label>
    <%=Html.TextArea("Resumen", Model.Resumen, 3, 35, new { @class = "input250", maxlength = 100 })%>
    <%=Html.ValidationMessage("Resumen")%>
</p>
