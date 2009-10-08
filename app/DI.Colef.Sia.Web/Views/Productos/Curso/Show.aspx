<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<CursoForm>>" %>
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
            Aqu&iacute; se muestra la informaci&oacute;n detallada del curso como est&aacute; en el sistema.
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
                    <strong><%= Html.Encode(Model.Form.DepartamentoNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Sede</label>
                    <strong><%= Html.Encode(Model.Form.SedeNombre)%>&nbsp;</strong>
                </p>
                
                <p>
	                <label>Nombre del curso</label>
                    <strong><%= Html.Encode(Model.Form.Nombre) %>&nbsp;</strong>
                </p>
                <p>
	                <label>Programa de estudio</label>
	                <strong><%= Html.Encode(Model.Form.ProgramaEstudioNombre)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Instituci&oacute;n</label>
	                <strong><%= Html.Encode(Model.Form.InstitucionNombre)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Nivel de Estudio</label>
	                <strong><%= Html.Encode(Model.Form.NivelEstudioNombre)%>&nbsp;</strong>
                </p>
                <p>
	                <label>N&uacute;mero de horas</label>
                    <strong><%= Html.Encode(Model.Form.NumeroHoras)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Pa&iacute;s</label>
	                <strong><%= Html.Encode(Model.Form.PaisNombre)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Periodo de referencia</label>
	                <strong><%=Html.Encode(Model.Form.PeriodoReferenciaPeriodo)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Fecha inicial</label>
                    <strong><%= Html.Encode(Model.Form.FechaInicial)%>&nbsp;</strong><span>Formato (dd/mm/yyyy)</span>
                </p>
                <p>
                    <label>Fecha final</label>
                    <strong><%= Html.Encode(Model.Form.FechaFinal)%>&nbsp;</strong><span>Formato (dd/mm/yyyy)</span>
                </p>
                
                <h4>Opcionales</h4>                
                <p>
	                <label>Sector</label>
	                <strong><%= Html.Encode(Model.Form.SectorNombre)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Organizaci&oacute;n</label>
	                <strong><%= Html.Encode(Model.Form.OrganizacionNombre)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Nivel 2</label>
                    <strong><%= Html.Encode(Model.Form.Nivel2Nombre)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Nivel 3</label>
                    <strong><%= Html.Encode(Model.Form.Nivel3Nombre)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Nivel 4</label>
                    <strong><%= Html.Encode(Model.Form.Nivel4Nombre)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Nivel 5</label>
                    <strong><%= Html.Encode(Model.Form.Nivel5Nombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>&Aacute;rea</label>
                    <strong><%= Html.Encode(Model.Form.AreaNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Disciplina</label>
                    <strong><%= Html.Encode(Model.Form.DisciplinaNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Subdisciplina</label>
                    <strong><%= Html.Encode(Model.Form.SubdisciplinaNombre)%>&nbsp;</strong>
                </p>
                
                <p class="submit">
                    <%=Html.ActionLink<CursoController>(x => x.Index(), "Regresar") %>
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
