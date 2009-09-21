<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Participa estudiante</label>
    <%=Html.CheckBox("ParticipaEstudiante", Model.ParticipaEstudiante)%>
    <%=Html.ValidationMessage("ParticipaEstudiante")%>
</p>
<p>
    <label>Nombre del estudiante</label>
    <%=Html.TextBox("NombreEstudiante", Model.NombreEstudiante, new { @class = "input250", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("NombreEstudiante")%>
</p>
<p>
    <label>Tipo de estudiante</label>
    <%=Html.DropDownList("TipoEstudiante", Model.TiposEstudiantes.CreateSelectList<TipoEstudianteForm>("Id", "Nombre"),
                "Seleccione ...")%>
    <%=Html.ValidationMessage("TipoEstudiante")%>
</p>
<p>
    <label>Grado acad&eacute;mico</label>
    <%=Html.DropDownList("GradoAcademico", Model.GradosAcademicos.CreateSelectList<GradoAcademicoForm>("Id", "Nombre"),
                "Seleccione ...")%>
    <%=Html.ValidationMessage("GradoAcademico")%>
</p>