<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CursoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
	<label>N&uacute;mero Horas</label>
    <%=Html.TextBox("NumeroHoras", Model.NumeroHoras, new { @class = "input250-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("NumeroHoras")%>
</p>
<p>
	<label>Periodo Referencia</label>
	<%=Html.DropDownList("PeriodoReferencia", Model.PeriodosReferencias.CreateSelectList<PeriodoReferenciaForm>("Id", "Periodo"),
		"Seleccione ...")%>
	<%=Html.ValidationMessage("PeriodoReferencia") %>
</p>
<p>
	<label>Programa Estudio</label>
	<%=Html.DropDownList("ProgramaEstudio", Model.ProgramasEstudios.CreateSelectList<ProgramaEstudioForm>("Id", "Nombre"),
		"Seleccione ...")%>
    <%=Html.ValidationMessage("ProgramaEstudio") %>
</p>
<p>
	<label>Instituci&oacute;n</label>
	<%=Html.DropDownList("Institucion", Model.Instituciones.CreateSelectList<InstitucionForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<%=Html.ValidationMessage("Institucion") %>
</p>
<p>
	<label>Nivel</label>
	<%=Html.DropDownList("Nivel", Model.Niveles.CreateSelectList<NivelForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<%=Html.ValidationMessage("Nivel") %>
</p>
