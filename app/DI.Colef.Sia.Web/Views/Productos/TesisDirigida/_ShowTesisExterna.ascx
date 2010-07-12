<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<TesisDirigidaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<% if(!Model.IsShowForm){ %>
    <p>
        <label>Nombre del alumno (autor)</label>
        <%=Html.TextBox("NombreAlumno", Model.NombreAlumno, new { @class = "input420-bold-requerido", maxlength = 100 })%>
        <%=Html.ValidationMessage("NombreAlumno")%>
    </p>
    <p>
        <label>T&iacute;tulo de la tesis</label>
	    <%=Html.TextBox("Titulo", Model.Titulo, new { @class = "input420-requerido", maxlength = 100 })%>
	    <%=Html.ValidationMessage("Titulo")%>
    </p>
    <p>
        <label>Forma de participaci&oacute;n</label>
        <%=Html.DropDownList("FormaParticipacion", Model.FormasParticipaciones.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
            "Seleccione ...", new { @class = "requerido" })%>
        <%=Html.ValidationMessage("FormaParticipacion") %>
    </p>
    <p>
	    <label>Programa de estudios</label>
	    <%=Html.TextBox("ProgramaEstudio", Model.ProgramaEstudio, new { @class = "input420-requerido", maxlength = 100 })%>
        <span class="cvu"></span>
        <%=Html.ValidationMessage("ProgramaEstudio")%>
    </p>
    <p>
	    <label></label>
	    ¿Pertenece al PNPC? <%=Html.CheckBox("PertenecePNPC", Model.PertenecePNPC)%>
	    <br /><label></label><span>(Marque en caso positivo)</span>
    </p>
    <p>
        <label>Grado acad&eacute;mico obtenido/por obtener</label>
        <%=Html.DropDownList("GradoAcademico", Model.GradosAcademicos.CreateSelectList<GradoAcademicoForm>("Id", "Nombre"),
            "Seleccione ...", new { @class = "requerido" })%>
        <span class="cvu"></span>                
        <%=Html.ValidationMessage("GradoAcademico") %>
    </p>
    <p>
        <label>Fecha de obtenci&oacute;n de grado</label>
        <%=Html.TextBox("FechaGrado", Model.FechaGrado, new { @class = "datetime input100-requerido", maxlength = 10 })%>
        <span>(Formato dd/mm/aaaa)</span>
        <span class="cvu"></span>
        <%=Html.ValidationMessage("FechaGrado")%>
    </p>

    <% Html.RenderPartial("_ShowInstitucionShort", new ShowFieldsForm { InstitucionId = Model.InstitucionId, InstitucionNombre = Model.InstitucionNombre, InstitucionLabel = "Institución", IsShowForm = false }); %>
    <p>
	    <label></label>
	    ¿Esta instituci&oacute;n tiene convenio general con El Colef? <%=Html.CheckBox("TieneConvenio", Model.TieneConvenio)%>
	    <br /><label></label><span>(Marque en caso positivo)</span>
    </p>
    <p>
        <label>Vinculaci&oacute;n con la APyD</label>
        <%=Html.DropDownList("VinculacionAPyD", Model.VinculacionesAPyDs.CreateSelectList<VinculacionAPyDForm>("Id", "Nombre"),
            "Seleccione ...")%>
        <%=Html.ValidationMessage("VinculacionAPyD")%>
    </p>
    
    <% Html.RenderPartial("_Show2doNivel", new ShowFieldsForm { Sectores = Model.Sectores, Organizaciones = Model.Organizaciones, Niveles = Model.Niveles, IsShowForm = false }); %>

<% } else { %>

    <p>
        <label>Nombre del alumno(autor)</label>
        <span class="valor"><%= Html.Encode(Model.NombreAlumno) %>&nbsp;</span>
    </p>
    <p>
        <label>T&iacute;tulo de la tesis</label>
        <span class="valor"><%= Html.Encode(Model.Titulo) %>&nbsp;</span>
    </p>
    <p>
        <label>Forma de participaci&oacute;n</label>
        <span class="valor"><%= HumanizeHelper.FormaParticipacion(Model.FormaParticipacion) %>&nbsp;</span>
    </p>
    <p>
        <label>Programa de estudios</label>
        <span class="valor"><%= Html.Encode(Model.ProgramaEstudio) %>&nbsp;</span>
    </p>
    <p>
        <label></label>
        <span class="valor">¿Pertenece al PNPC? <%= Html.Encode(Model.PertenecePNPC) %>&nbsp;</span>
    </p>
    <p>
        <label>Grado acad&eacute;mico obtenido/por obtener</label>
        <span class="valor"><%= Html.Encode(Model.GradoAcademicoNombre) %>&nbsp;</span>
    </p>
    <p>
        <label>Fecha de obtenci&oacute;n de grado</label>
        <span class="valor"><%= Html.Encode(Model.FechaGrado) %>&nbsp;</span>
    </p>

    <% Html.RenderPartial("_ShowInstitucionShort", Model.ShowFields); %>
    <p>
        <label></label>
        <span class="valor">¿Esta instituci&oacute;n tiene convenio general con El Colef? <%=Html.Encode(Model.TieneConvenio)%>&nbsp;</span>
    </p>
    <p>
        <label>Vinculaci&oacute;n con la APyD</label>
        <span class="valor"><%= Html.Encode(Model.VinculacionAPyDNombre) %>&nbsp;</span>
    </p>
    
    <% Html.RenderPartial("_Show2doNivel", Model.ShowFields); %>
<% } %>