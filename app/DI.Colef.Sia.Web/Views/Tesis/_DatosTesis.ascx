<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<TesisForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
	    <td class="label">
		    <label>Titulo:<em>*</em></label>
		    <br />
			<%=Html.TextBox("Titulo", Model.Titulo, new { maxlength = 100 })%>
			<%=Html.ValidationMessage("Titulo")%>
	    </td>
	    <td class="label">
		    <label>Fecha Conclusion:<em>*</em></label>
		    <br />
		    <%=Html.TextBox("FechaConclusion", Model.FechaConclusion, new { @class="datetime", maxlength = 10 })%>
            <span class="helper_message">(Formato dd/mm/yyyy)</span>
            <%=Html.ValidationMessage("FechaConclusion")%>
	    </td>
    </tr>
    <tr>
	    <td class="label">
		    <label>Autor:<em>*</em></label>
		    <br />
		    <%=Html.TextBox("Autor", Model.Autor, new { maxlength = 100 })%>
		    <%=Html.ValidationMessage("Autor")%>
	    </td>
	    <td class="label">
		    <label>Pais:<em>*</em></label>
		    <br />
		    <%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
				    "Seleccione ...")%>
		    <%=Html.ValidationMessage("Pais") %>
	    </td>
    </tr>
    <tr>
	    <td class="label">
		    <label>Grado Academico:<em>*</em></label>
		    <br />
		    <%=Html.DropDownList("GradoAcademico", Model.GradosAcademicos.CreateSelectList<GradoAcademicoForm>("Id", "Nombre"),
				    "Seleccione ...")%>
		    <%=Html.ValidationMessage("GradoAcademico") %>
	    </td>
	    <td class="label">
		    <label>Fecha de obtencion del Grado:<em>*</em></label>
		    <br />
		    <%=Html.TextBox("FechaGrado", Model.FechaGrado, new { @class="datetime", maxlength = 10 })%>
            <span class="helper_message">(Formato dd/mm/yyyy)</span>
            <%=Html.ValidationMessage("FechaGrado")%>
	    </td>
    </tr>
    <tr>
	    <td class="label">
		    <label>Forma Participacion:<em>*</em></label>
		    <br />
		    <%=Html.DropDownList("FormaParticipacion", Model.FormasParticipaciones.CreateSelectList<FormaParticipacionForm>("Id", "Nombre"),
				    "Seleccione ...")%>
		    <%=Html.ValidationMessage("FormaParticipacion") %>
	    </td>
	    <td class="label">
		    <label>Institucion:<em>*</em></label>
		    <br />
		    <%=Html.DropDownList("Institucion", Model.Instituciones.CreateSelectList<InstitucionForm>("Id", "Nombre"),
				    "Seleccione ...")%>
		    <%=Html.ValidationMessage("Institucion") %>
	    </td>
    </tr>
    <tr>
	    <td class="label">
		    <label>Programa Estudio:<em>*</em></label>
		    <br />
		    <%=Html.DropDownList("ProgramaEstudio", Model.ProgramasEstudios.CreateSelectList<ProgramaEstudioForm>("Id", "Nombre"),
				    "Seleccione ...")%>
		    <%=Html.ValidationMessage("ProgramaEstudio") %>
	    </td>
	    <td class="label">
		    <label>Linea Tematica:<em>*</em></label>
		    <br />
		    <%=Html.DropDownList("LineaTematica", Model.LineasTematicas.CreateSelectList<LineaTematicaForm>("Id", "Nombre"),
				    "Seleccione ...")%>
		    <%=Html.ValidationMessage("LineaTematica") %>
	    </td>
    </tr>
    <tr>
	    <td class="label">
		    <label>Periodo Referencia:<em>*</em></label>
		    <br />
		    <%=Html.DropDownList("PeriodoReferencia", Model.PeriodosReferencias.CreateSelectList<PeriodoReferenciaForm>("Id", "Periodo"),
				    "Seleccione ...")%>
		    <%=Html.ValidationMessage("PeriodoReferencia") %>
	    </td>
    </tr>
</table>
