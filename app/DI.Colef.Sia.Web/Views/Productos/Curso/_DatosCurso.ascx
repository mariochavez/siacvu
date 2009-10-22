<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CursoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label></label>
    <%= Html.CheckBox("EsDiplomado", Model.EsDiplomado)%> Es diplomado?
</p>
<p>
	<label>Nombre del diplomado</label>
    <%=Html.DropDownList("Diplomado", Model.Diplomados.CreateSelectList<DiplomadoForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
	<%=Html.ValidationMessage("Diplomado")%>
</p>
<p>
	<label>Nombre del curso</label>
    <%=Html.TextBox("Nombre", Model.Nombre, new { @class = "input420-bold-requerido", maxlength = 100 })%>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("Nombre")%>
</p>
<p>
	<label>Programa de estudio</label>
	<%=Html.TextBox("ProgramaEstudioNombre", Model.ProgramaEstudioNombre,
        new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "ProgramaEstudio"), maxlength = 100 })%>
    <%=Html.Hidden("ProgramaEstudioId", Model.ProgramaEstudioId, new { rel = "#ProgramaEstudioNombre" })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("ProgramaEstudioNombre")%>
</p>
<p>
	<label>Instituci&oacute;n</label>
	<%=Html.TextBox("InstitucionNombre", Model.InstitucionNombre,
        new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "Institucion"), maxlength = 100 })%>
    <%=Html.Hidden("InstitucionId", Model.InstitucionId, new { rel = "#InstitucionNombre" })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("InstitucionNombre")%>
</p>
<p>
	<label>Nivel de Estudio</label>
	<%=Html.DropDownList("NivelEstudio", Model.NivelEstudios.CreateSelectList<NivelEstudioForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <span class="cvu"></span>
	<%=Html.ValidationMessage("NivelEstudio")%>
</p>
<p>
    <label>Fecha inicial</label>
    <%=Html.TextBox("FechaInicial", Model.FechaInicial, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("FechaInicial")%>
</p>
<p>
    <label>Fecha final</label>
    <%=Html.TextBox("FechaFinal", Model.FechaFinal, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("FechaFinal")%>
</p>
<p>
	<label>N&uacute;mero de horas</label>
    <%=Html.TextBox("NumeroHoras", Model.NumeroHoras, new { @class = "input100-requerido", maxlength = 3 })%>
    <span class="cvu"></span>
	<%=Html.ValidationMessage("NumeroHoras")%>
</p>