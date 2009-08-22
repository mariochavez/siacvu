<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CursoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
	<label>Nombre del Curso</label>
    <%=Html.TextBox("Nombre", Model.Nombre, new { @class = "input250-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("Nombre")%>
</p>
<p>
	<label>Programa Estudio</label>
	<%=Html.DropDownList("ProgramaEstudio", Model.ProgramasEstudios.CreateSelectList<ProgramaEstudioForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("ProgramaEstudio") %>
</p>
<p>
	<label>Instituci&oacute;n</label>
	<%=Html.DropDownList("Institucion", Model.Instituciones.CreateSelectList<InstitucionForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
	<%=Html.ValidationMessage("Institucion") %>
</p>
<p>
	<label>Nivel</label>
	<%=Html.DropDownList("Nivel", Model.Niveles.CreateSelectList<NivelForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
	<%=Html.ValidationMessage("Nivel") %>
</p>
<p>
	<label>N&uacute;mero Horas</label>
    <%=Html.TextBox("NumeroHoras", Model.NumeroHoras, new { @class = "input250-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("NumeroHoras")%>
</p>
<p>
	<label>Pa&iacute;s</label>
	<%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<%=Html.ValidationMessage("Pais") %>
</p>
<p>
	<label>Periodo Referencia</label>
	<%=Html.Encode(Model.PeriodoReferencia.Periodo)%>
    <%=Html.Hidden("PeriodoReferenciaId", Model.PeriodoReferencia.Id) %>
</p>
<p>
    <label>Fecha Inicial</label>
    <%=Html.TextBox("FechaInicial", Model.FechaInicial, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaInicial")%>
</p>
<p>
    <label>Fecha Final</label>
    <%=Html.TextBox("FechaFinal", Model.FechaFinal, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaFinal")%>
</p>
