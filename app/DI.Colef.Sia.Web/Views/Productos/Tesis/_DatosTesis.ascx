<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<TesisForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>T&iacute;tulo</label>
	<%=Html.TextBox("Titulo", Model.Titulo, new { @class = "input250-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("Titulo")%>
</p>
<p>
    <label>Fecha de Conclusi&oacute;n</label>
    <%=Html.TextBox("FechaConclusion", Model.FechaConclusion, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaConclusion")%>
</p>
<p>
    <label>Autor</label>
    <%=Html.TextBox("Autor", Model.Autor, new { @class = "input250-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("Autor")%>
</p>
<p>
    <label>Pa&iacute;s</label>
    <%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Pais") %>
</p>
<p>
    <label>Grado Acad&eacute;mico</label>
    <%=Html.DropDownList("GradoAcademico", Model.GradosAcademicos.CreateSelectList<GradoAcademicoForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("GradoAcademico") %>
</p>
<p>
    <label>Fecha de obtenci&oacute;n del Grado</label>
    <%=Html.TextBox("FechaGrado", Model.FechaGrado, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaGrado")%>
</p>
<p>
    <label>Forma Participaci&oacute;n</label>
    <%=Html.DropDownList("FormaParticipacion", Model.FormasParticipaciones.CreateSelectList<FormaParticipacionForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("FormaParticipacion") %>
</p>
<p>
    <label>Instituci&oacute;n</label>
    <%=Html.DropDownList("Institucion", Model.Instituciones.CreateSelectList<InstitucionForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Institucion") %>
</p>
<p>
    <label>Programa Estudio</label>
    <%=Html.DropDownList("ProgramaEstudio", Model.ProgramasEstudios.CreateSelectList<ProgramaEstudioForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("ProgramaEstudio") %>
</p>
<p>
    <label>L&iacute;nea Tem&aacute;tica</label>
    <%=Html.DropDownList("LineaTematica", Model.LineasTematicas.CreateSelectList<LineaTematicaForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("LineaTematica") %>
</p>
<p>
    <label>Periodo Referencia</label>
    <%=Html.Encode(Model.PeriodoReferencia.Periodo)%>
</p>