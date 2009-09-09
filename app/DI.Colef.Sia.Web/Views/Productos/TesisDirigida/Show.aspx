<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<TesisDirigidaForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2>
        <%=Html.Encode(Model.Title) %>
    </h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
    <div id="introduccion">
        <p>
            Aqu&iacute; se muestra la informaci&oacute;n detallada de la tesis dirigida como est&aacute; en el sistema.
		</p>
    </div><!--end introduccion-->
</asp:Content>

<asp:Content ID="sidebarContent" ContentPlaceHolderID="SidebarContentPlaceHolder" runat="server">
    <div id="barra">
        <div id="asistente">
            <h3>Asistente de secci&oacute;n</h3>
            <% Html.RenderPartial("_ShowSidebar"); %>
        </div><!--end asistente-->

    </div><!--end barra-->
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div id="textos">

        <div id="forma">
            <div class="elementodescripcion">
                <p>
                    <label>T&iacute;tulo</label>
                    <%= Html.Encode(Model.Form.Titulo) %>
                </p>
                <p>
                    <label>Fecha de conclusi&oacute;n<label>
                    <%= Html.Encode(Model.Form.FechaConclusion) == "" ? "<span>No tiene fecha de conclusión registrada</span>" : Html.Encode(Model.Form.FechaConclusion)%>
                </p>
                <p>
                    <label>Pa&iacute;s</label>
                    <%= Html.Encode(Model.Form.PaisNombre) == "" ? "<span>No hay país registrado</span>" : Html.Encode(Model.Form.PaisNombre)%>
                </p>
                
                <p>
                    <label>Grado acad&eacute;mico<label>
                    <%= Html.Encode(Model.Form.GradoAcademicoNombre) == "" ? "<span>No hay grado académico registrado</span>" : Html.Encode(Model.Form.GradoAcademicoNombre)%>
                </p>
                <p>
                    <label>Fecha de obtenci&oacute;n del grado<label>
                    <%= Html.Encode(Model.Form.FechaGrado) == "" ? "<span>No hay fecha de obtención del grado registrada</span>" : Html.Encode(Model.Form.FechaGrado)%>
                </p>
                <p>
                    <label>Forma de participaci&oacute;n<label>
                    <%= Html.Encode(Model.Form.FormaParticipacionNombre) == "" ? "<span>No hay forma de participación registrada</span>" : Html.Encode(Model.Form.FormaParticipacionNombre)%>
                </p>
                <p>
                    <label>Instituci&oacute;n<label>
                    <%= Html.Encode(Model.Form.InstitucionNombre) == "" ? "<span>No hay institución registrada</span>" : Html.Encode(Model.Form.InstitucionNombre)%>
                </p>
                <p>
                    <label>Programa de estudio<label>
                    <%= Html.Encode(Model.Form.ProgramaEstudioNombre) == "" ? "<span>No hay programa de estudio registrado</span>" : Html.Encode(Model.Form.ProgramaEstudioNombre)%>
                </p>
                <p>
                    <label>L&iacute;nea tem&aacute;tica</label>
                    <%= Html.Encode(Model.Form.LineaTematicaNombre) == "" ? "<span>No hay línea temática registrada</span>" : Html.Encode(Model.Form.LineaTematicaNombre) %>
                </p>
                <p>
                    <label>Periodo de referencia</label>
                    <%= Html.Encode(Model.Form.PeriodoReferenciaPeriodo) %>
                </p>                
                <p>
                    <label>Nombre del alumno<label>
                    <%= Html.Encode(Model.Form.NombreAlumno) == "" ? "<span>No hay nombre del alumno registrado</span>" : Html.Encode(Model.Form.NombreAlumno)%>
                </p>               
                
                <h4>Opcionales</h4>
                <p>
                    <label>Sector<label>
                    <%= Html.Encode(Model.Form.SectorNombre) == "" ? "<span>No hay sector registrado</span>" : Html.Encode(Model.Form.SectorNombre)%>    
                </p>
                <p>
                    <label>Dependencia<label>
                    <%= Html.Encode(Model.Form.DependenciaNombre) == "" ? "<span>No hay dependencia registrada</span>" : Html.Encode(Model.Form.DependenciaNombre)%>    
                </p>
                <p>
                    <label>Departamento<label>
                    <%= Html.Encode(Model.Form.DepartamentoNombre) == "" ? "<span>No hay departamento registrado</span>" : Html.Encode(Model.Form.DepartamentoNombre)%>    
                </p>
                <p>
                    <label>&Aacute;rea</label>
                    <%= Html.Encode(Model.Form.AreaNombre) == "" ? "<span>No hay área registrada</span>" : Html.Encode(Model.Form.AreaNombre)%>    
                </p>
                <p>
                    <label>Disciplina</label>
                    <%= Html.Encode(Model.Form.DisciplinaNombre) == "" ? "<span>No hay disciplina registrada</span>" : Html.Encode(Model.Form.DisciplinaNombre)%>
                </p>
                <p>
                    <label>Subdisciplina</label>
                    <%= Html.Encode(Model.Form.SubdisciplinaNombre) == "" ? "<span>No hay subdisciplina registrada</span>" : Html.Encode(Model.Form.SubdisciplinaNombre)%> 
                </p>
                
                
                <p class="submit">
                    <%=Html.ActionLink<TesisDirigidaController>(x => x.Index(), "Regresar") %>
                </p>
            </div><!--end elementodescripcion-->
        </div><!--end lista-->

    </div><!--end textos-->
    
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
    });
</script>
</asp:Content>
