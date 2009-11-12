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
            <div id="campos">
                <h4>Datos del investigador</h4>
	            <p>
                    <label>Departamento</label>
                    <span class="valor"><%= Html.Encode(Model.Form.DepartamentoInvestigadorNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Sede</label>
                    <span class="valor"><%= Html.Encode(Model.Form.SedeNombre)%>&nbsp;</span>
                </p>
                
                <p>
                    <label>T&iacute;tulo</label>
                    <span class="valor"><%= Html.Encode(Model.Form.Titulo) %>&nbsp;</span>
                </p>
                <p>
                    <label>Fecha de conclusi&oacute;n</label>
                    <span class="valor"><%= Html.Encode(Model.Form.FechaConclusion)%>&nbsp;</span>
                    <span>Formato (dd/mm/yyyy)</span>
                </p>
                <p>
                    <label>Pa&iacute;s</label>
                    <span class="valor"><%= Html.Encode(Model.Form.PaisNombre)%>&nbsp;</span>
                </p>                
                <p>
                    <label>Grado acad&eacute;mico</label>
                    <span class="valor"><%= Html.Encode(Model.Form.GradoAcademicoNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Fecha de obtenci&oacute;n del grado</label>
                    <span class="valor"><%= Html.Encode(Model.Form.FechaGrado)%>&nbsp;</span>
                    <span>Formato (dd/mm/yyyy)</span>
                </p>
                <p>
                    <label>Forma de participaci&oacute;n</label>
                    <span class="valor"><%= Html.Encode(Model.Form.FormaParticipacionNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Instituci&oacute;n</label>
                    <span class="valor"><%= Html.Encode(Model.Form.InstitucionNombre)%>&nbsp;</span>
                </p>                
                <p>
                    <label>Nombre del alumno</label>
                    <span class="valor"><%= Html.Encode(Model.Form.NombreAlumno)%>&nbsp;</span>
                </p>               
                
                <h4>Opcionales</h4>
                <p>
	                <label>Sector</label>
	                <span class="valor"><%= Html.Encode(Model.Form.SectorNombre)%>&nbsp;</span>
                </p>
                <p>
	                <label>Organizaci&oacute;n</label>
	                <span class="valor"><%= Html.Encode(Model.Form.OrganizacionNombre)%>&nbsp;</span>
                </p>
                <p>
	                <label>Nivel 2</label>
                    <span class="valor"><%= Html.Encode(Model.Form.Nivel2Nombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>&Aacute;rea</label>
                    <span class="valor"><%= Html.Encode(Model.Form.AreaNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Disciplina</label>
                    <span class="valor"><%= Html.Encode(Model.Form.DisciplinaNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Subdisciplina</label>
                    <span class="valor"><%= Html.Encode(Model.Form.SubdisciplinaNombre)%>&nbsp;</span>
                </p>
                
                <p class="submit">
                    <%=Html.ActionLink<TesisDirigidaController>(x => x.Index(), "Regresar") %>
                </p>
            </div><!--end campos-->
        </div><!--end lista-->

    </div><!--end textos-->
    
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
    });
</script>
</asp:Content>