<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CursoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Tipo de curso</label>
    <%=Html.DropDownList("TipoCurso", Model.TiposCursos.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("TipoCurso")%>
</p>
<p class="cursointerno_field">
    <label></label>
    <%= Html.CheckBox("EsDiplomado", Model.EsDiplomado)%> Es diplomado?
</p>
<p id="cursointernodiplomado_field">
	<label>Nombre del curso</label>
	<%=Html.DropDownList("CursoInvestigadorId", Model.CursosInvestigadores.CreateSelectList<CursoInvestigadorForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
	<%=Html.ValidationMessage("CursoInvestigador")%>
</p>
<%--<p>
	<label>Nombre del diplomado</label>
    <%=Html.DropDownList("Diplomado", Model.Diplomados.CreateSelectList<DiplomadoForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
	<%=Html.ValidationMessage("Diplomado")%>
</p>--%>
<p class="diplomado_field">
	<label>Nombre del diplomado</label>
    <%=Html.TextBox("NombreDiplomado", Model.NombreDiplomado, new { @class = "input420-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("NombreDiplomado")%>
</p>
<p class="cursoexterno_field">
	<label>Nivel de estudio</label>
	<%=Html.DropDownList("NivelEstudio", Model.NivelEstudios.CreateSelectList<NivelEstudioForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <span class="cvu"></span>
	<%=Html.ValidationMessage("NivelEstudio")%>
</p>
<p class="cursoexterno_field">
	<label>Programa de estudio</label>
	<%=Html.TextBox("ProgramaEstudioNombre", Model.ProgramaEstudioNombre,
        new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "ProgramaEstudio"), maxlength = 100 })%>
    <%=Html.Hidden("ProgramaEstudioId", Model.ProgramaEstudioId, new { rel = "#ProgramaEstudioNombre" })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("ProgramaEstudioNombre")%>
</p>
<p class="cursoexterno_field">
	<label>Nombre del curso</label>
    <%=Html.TextBox("Nombre", Model.Nombre, new { @class = "input420-bold-requerido", maxlength = 100 })%>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("Nombre")%>
</p>
<div class="cursoexterno_field">
    <% Html.RenderPartial("_ShowInstitucion", new ShowFieldsForm { InstitucionId = Model.InstitucionId, InstitucionNombre = Model.InstitucionNombre, InstitucionLabel = "Institución", IsShowForm = false }); %>
</div>
<p class="cursoexternodiplomado_field">
    <label>Fecha inicial</label>
    <%=Html.TextBox("FechaInicial", Model.FechaInicial, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("FechaInicial")%>
</p>
<p class="cursoexternodiplomado_field">
    <label>Fecha final</label>
    <%=Html.TextBox("FechaFinal", Model.FechaFinal, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("FechaFinal")%>
</p>
<p class="cursoexternodiplomado_field">
	<label>N&uacute;mero de horas</label>
    <%=Html.TextBox("NumeroHoras", Model.NumeroHoras, new { @class = "input100-requerido", maxlength = 3 })%>
    <span class="cvu"></span>
	<%=Html.ValidationMessage("NumeroHoras")%>
</p>