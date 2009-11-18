<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<EstanciaAcademicaExternaForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
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
            Aqu&iacute; se muestra la informaci&oacute;n detallada de la estancia acad&eacute;mica externa como est&aacute; en el sistema.
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
                    <label>Grado acad&eacute;mico</label>
                    <span class="valor"><%= Html.Encode(Model.Form.GradoAcademicoNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Tipo de estancia</label>
                    <span class="valor"><%= Html.Encode(Model.Form.TipoEstanciaNombre)%>&nbsp;</span>
                </p>
                <h4>Datos de la estancia acad&eacute;mica externa</h4>
            	<p>
                    <label>Instituci&oacute;n de procedencia</label>
                    <span class="valor"><%= Html.Encode(Model.Form.InstitucionNombre)%>&nbsp;</span>
                </p>
                
                <% Html.RenderPartial("_ShowInstitucion", Model.Form.ShowFields); %>
                
                <p>
                    <label>L&iacute;neas de investigaci&oacute;n</label>
                    <span class="valor"><%= Html.Encode(Model.Form.LineasInvestigacion)%>&nbsp;</span>
                </p>
                <p>
                    <label>Fecha de inicio</label>
                    <span class="valor"><%= Html.Encode(Model.Form.FechaInicial)%>&nbsp;</span>
                    <span>Formato (dd/mm/yyyy)</span>
                </p>
                <p>
                    <label>Fecha de conclusi&oacute;n</label>
                    <span class="valor"><%= Html.Encode(Model.Form.FechaFinal)%>&nbsp;</span>
                    <span>Formato (dd/mm/yyyy)</span>
                </p>
                <p>
                    <label>Actividades acad&eacute;micas previstas</label>
                    <span class="valor"><%= Html.Encode(Model.Form.Actividades)%>&nbsp;</span>
                </p>
                <p>
                    <label>Principales logros</label>
                    <span class="valor"><%= Html.Encode(Model.Form.Logros)%>&nbsp;</span>
                </p>
                
                <p class="submit">
                    <%=Html.ActionLink<EstanciaAcademicaExternaController>(x => x.Index(), "Regresar") %>
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