<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CursoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
		<td>
			<label>Numero Horas:<em>*</em></label>
		</td>		    
		<td>
		    <%=Html.TextBox("NumeroHoras", Model.NumeroHoras, new { maxlength = 100 })%>
			<%=Html.ValidationMessage("NumeroHoras")%>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Periodo Referencia:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("PeriodoReferencia", Model.PeriodosReferencias.CreateSelectList<PeriodoReferenciaForm>("Id", "Periodo"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("PeriodoReferencia") %>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Programa Estudio:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("ProgramaEstudio", Model.ProgramasEstudios.CreateSelectList<ProgramaEstudioForm>("Id", "Nombre"),
				"Seleccione ...")%>
		    <%=Html.ValidationMessage("ProgramaEstudio") %>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Institucion:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("Institucion", Model.Instituciones.CreateSelectList<InstitucionForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("Institucion") %>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Nivel:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("Nivel", Model.Niveles.CreateSelectList<NivelForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("Nivel") %>
		</td>
	</tr>
</table>
