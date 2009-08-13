<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<TesisForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Titulo:</label>

	<%=Html.TextBox("Titulo", Model.Titulo, new { @class = "input250-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("Titulo")%>
</p>
<p>
    <label>Fecha Conclusion:</label>
   
    <%=Html.TextBox("FechaConclusion", Model.FechaConclusion, new { @class = "datetime input100", maxlength = 10 })%>
    <span class="helper_message">(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaConclusion")%>
</p>
<p>
    <label>Autor:</label>
   
    <%=Html.TextBox("Autor", Model.Autor, new { @class = "input250", maxlength = 100 })%>
    <%=Html.ValidationMessage("Autor")%>
</p>
<p>
    <label>Pais:</label>
   
    <%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
		    "Seleccione ...")%>
    <%=Html.ValidationMessage("Pais") %>
</p>
<p>
    <label>Grado Academico:</label>
   
    <%=Html.DropDownList("GradoAcademico", Model.GradosAcademicos.CreateSelectList<GradoAcademicoForm>("Id", "Nombre"),
		    "Seleccione ...")%>
    <%=Html.ValidationMessage("GradoAcademico") %>
</p>
<p>
    <label>Fecha de obtencion del Grado:</label>
  
    <%=Html.TextBox("FechaGrado", Model.FechaGrado, new { @class = "datetime input100", maxlength = 10 })%>
    <span class="helper_message">(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaGrado")%>
</p>
<p>
    <label>Forma Participacion:</label>

    <%=Html.DropDownList("FormaParticipacion", Model.FormasParticipaciones.CreateSelectList<FormaParticipacionForm>("Id", "Nombre"),
		    "Seleccione ...")%>
    <%=Html.ValidationMessage("FormaParticipacion") %>
</p>
<p>
    <label>Institucion:</label>

    <%=Html.DropDownList("Institucion", Model.Instituciones.CreateSelectList<InstitucionForm>("Id", "Nombre"),
		    "Seleccione ...")%>
    <%=Html.ValidationMessage("Institucion") %>
</p>
<p>
    <label>Programa Estudio:</label>

    <%=Html.DropDownList("ProgramaEstudio", Model.ProgramasEstudios.CreateSelectList<ProgramaEstudioForm>("Id", "Nombre"),
		    "Seleccione ...")%>
    <%=Html.ValidationMessage("ProgramaEstudio") %>
</p>
<p>
    <label>Linea Tematica:</label>

    <%=Html.DropDownList("LineaTematica", Model.LineasTematicas.CreateSelectList<LineaTematicaForm>("Id", "Nombre"),
		    "Seleccione ...")%>
    <%=Html.ValidationMessage("LineaTematica") %>
</p>
<p>
    <label>Periodo Referencia:</label>

    <%=Html.DropDownList("PeriodoReferencia", Model.PeriodosReferencias.CreateSelectList<PeriodoReferenciaForm>("Id", "Periodo"),
		    "Seleccione ...")%>
    <%=Html.ValidationMessage("PeriodoReferencia") %>
</p>